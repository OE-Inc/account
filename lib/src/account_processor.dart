import 'dart:convert';

import 'package:account/src/account.dart';
import 'package:account/src/constants.dart';
import 'package:account/src/events.dart';
import 'package:account/src/form/error_info.dart';
import 'package:account/src/form/login_info.dart';
import 'package:account/src/form/token_info.dart';
import 'package:account/src/form/user_info.dart';
import 'package:account/src/urls.dart';
import 'package:event_bus/event_bus.dart';
import 'package:utils/utils.dart';

import 'form/avatar_update_info.dart';
import 'form/register_info.dart';
import 'form/retrieve_info.dart';
import 'form/update_user_info.dart';

class AccountProcessor {

  static AccountProcessor _processor = AccountProcessor._internal();

  AccountProcessor._internal();

  static AccountProcessor get processor => _processor;

  EventBus _bus;
  var _accounts = Map<String, Account>();

  set eventBus(EventBus bus) => _bus = bus;

  String lastLoginId;

  Map<String, Account> get accounts => Map.from(_accounts);

  String get savingString => JsonEncoder().convert({
    "lastLoginId": lastLoginId,
    "accounts": _accounts.map((key, value) => MapEntry(key, value.toJson())),
  });

  void restore(String json) {
    Map<String, dynamic> map = JsonDecoder().convert(json);
    lastLoginId = map['lastLoginId'];

    map['accounts']?.forEach((key, value) {
      _accounts[key] = Account.fromJson(value);
    });
  }

  Account remove(String loginId) => _accounts.remove(loginId);

  Account getByLoginId(String loginId) => _get(loginId);

  Account getByUserId(String userId) {
    return _accounts.values.firstWhere((a) => a.userId == userId, orElse: () => null);
  }

  Account _get(String loginId) {
    Account account = _accounts[loginId];
    if(account == null) {
      account = Account(loginId: loginId);
    }
    _accounts[loginId] = account;
    return account;
  }

  Future<HttpResponse> execute(HttpRequest request) async {
    var rsp = await HttpEngine.engine.execute(request);
    var r = rsp.response ?? {};

    if(!rsp.isSuccessful) {
      throw ErrorInfo(rsp.code, r['reason'], r['errDispMsg']);
    }

    var rspCode = r["rspCode"];
    if(rspCode == null || !(rspCode is int)) {
      throw ErrorInfo(HttpResponse.NO_RSP_CODE, r['reason'], r['errDispMsg']);
    }

    if (rspCode != RspCode.Base.OK) {
      throw ErrorInfo.fromJson(rsp.response);
    }

    return rsp;
  }

  /// 请求发送验证码流程, 返回值可能是：
  ///   Map<String, dynamic>: 请求成功，包含"rspCode"、"expiresIn"和"envId"
  ///
  /// 失败则会抛出异常
  Future<Map<String, dynamic>> ownerValidate(String authTo, {String packageId}) async {

    var params = {
      "authTo": authTo,
      "type": "owner"
    };
    if(packageId != null) {
      params["packageId"] = packageId;
    }
    var request = HttpRequest(
      Method.GET,
      UrlFactory.getOwnerUrl(Account.terminalId),
      queryParams: params
    );
    var rsp = await execute(request);

    var rspCode = rsp.response["rspCode"];
    var env = rsp.response["env"];
    if(env == null || !(env is Map<String, dynamic>)) {
      throw ErrorInfo(RspCode.NetworkLocal.RSP_ERROR, "$env", "");
    }

    var expiresIn = env["expiresIn"];
    var envId = env["envId"];
    if(expiresIn is int && expiresIn > 0) {
      return {
        "rspCode": rspCode,
        "expiresIn": expiresIn,
        "envId": envId == null? Account.terminalId : envId
      };
    }

    throw ErrorInfo.fromJson(rsp.response);
  }

  /// 注册流程, 失败抛出异常
  Future<void> register(String loginId, RegisterInfo registerInfo) async {
    if(registerInfo.env.envId == null) {
      registerInfo.env.envId = Account.terminalId;
    }

    var request = HttpRequest(
      Method.PUT,
      UrlFactory.getRegisterUrl(loginId),
      data: registerInfo.toJson()
    );

    await execute(request);
  }

  void loginLocalUser(String localName) {
    var local = _accounts[LOCAL_LOGIN_ID];
    if(local == null) {
      local = Account(loginId: LOCAL_LOGIN_ID);
    }
    local.userInfo.baseInfo.nickName = localName;
    local.userInfo.loginInfo.status = STAT_NORMAL;
    local.tokenInfo.userId = LOCAL_USER_ID;
    local.isLogin = true;
    local.tokenInfo.tokens.accessToken = INVALID_TOKEN;
    local.tokenInfo.tokens.refreshToken = INVALID_TOKEN;
    local.tokenInfo.tokens.loginUtc = DateTime.now().millisecondsSinceEpoch;
    local.tokenInfo.tokens.expiresIn = 0xFFFFFFFFFFFF;

    _accounts[LOCAL_LOGIN_ID] = local;

    _bus?.fire(LoginSuccess(LOCAL_LOGIN_ID));
  }

  Future<void> loginByExternalToken(String loginId, String userId, String accessToken) async {
    var user = _accounts[loginId];
    if(user == null) {
      user = Account(loginId: loginId);
    }

    user.userInfo.loginInfo.status = STAT_NORMAL;

    user.tokenInfo.userId = userId;

    user.isLogin = true;
    user.tokenInfo.tokens.accessToken = accessToken;
    user.tokenInfo.tokens.refreshToken = INVALID_TOKEN;
    user.tokenInfo.tokens.loginUtc = DateTime.now().millisecondsSinceEpoch;
    user.tokenInfo.tokens.expiresIn = 0xFFFFFFFFFFFF;

    _accounts[loginId] = user;
    _bus?.fire(LoginSuccess(loginId));

    await pullUserInfo(user, userId);
  }

  Future<void> login(String loginId, LoginInfo loginInfo) async {
    if(LOCAL_USER_ID.toLowerCase() == loginId.toLowerCase()) {
      return loginLocalUser(loginId);
    }

    lastLoginId = loginId;

    if(loginInfo.clientId == null) {
      loginInfo.clientId = Account.clientId;
    }
    loginInfo.clientInfo.account.v = VERSION.toString();

    var request = HttpRequest(
      Method.PUT,
      UrlFactory.getLoginUrl(loginId, Account.terminalId),
      data: loginInfo.toJson()
    );

    var loginUtc = DateTime.now().millisecondsSinceEpoch;
    var rsp = await execute(request);

    Account account = _get(loginId);
    account.tokenInfo = TokenInfo.fromJson(rsp.response);
    account.userInfo = UserInfo.fromJson(rsp.response);

    var token = account.tokenInfo?.tokens?.accessToken;
    var userId = account.tokenInfo?.userId;

    if(token == null || token.isEmpty) {
      return RspCode.NetworkLocal.RSP_INVALID_TOKEN;
    }

    if(userId == null || userId.isEmpty) {
      throw ErrorInfo(RspCode.NetworkLocal.RSP_INVALID_USERID, "", "");
    }

    var loginUtcBack = account.tokenInfo.tokens.loginUtc;
    if(loginUtcBack == null || loginUtcBack < loginUtc) {
      account.tokenInfo.tokens.loginUtc = loginUtc;
    }

    account.isLogin = true;

    _bus?.fire(LoginSuccess(loginId));
  }

  Future<void> logout(String loginId, { bool delete = false, String password, String envId, String verificationCode }) async {
    var account = _accounts[loginId];
    if(account == null) {
      throw ErrorInfo(RspCode.NetworkLocal.NOT_LOGIN, "", "");
    }

    if(account.isLocalUser) {
      remove(loginId);
      _bus?.fire(LogoutSuccess(loginId));
      return;
    }

    var request = HttpRequest(
      Method.DELETE,
      delete
        ? UrlFactory.makeSimpleUrl('/v2/user/users/${account.userId}')
        : UrlFactory.getLogoutUrl(account.userId, Account.terminalId)
      ,
      data: {
        "accessToken": account.tokenInfo.tokens.accessToken,
        "refreshToken": account.tokenInfo.tokens.refreshToken,
        "loginId": loginId,

        if (delete && envId != null) "env": {
          "envId": envId,
          "result": verificationCode,
        } else if (delete && password != null)
          "password": password,
      }
    );

    await execute(request);

    remove(loginId);
    _bus?.fire(LogoutSuccess(loginId));
  }


  Future<void> deleteAccount(String loginId, {
    String envId,
    String verificationCode,
    String password,
  }) {
    return logout(loginId, delete: true, password: password, envId: envId, verificationCode: verificationCode);
  }


  Future<void> refreshToken(String loginId, { bool tokenExpired }) {
    return _refreshToken(loginId, tokenExpired: tokenExpired).catchError((error) {
      if(tokenExpired == true || (error is ErrorInfo && error.rspCode == RspCode.Base.NOT_FOUND)) {
        _bus?.fire(TokenExpired(loginId));
      }
      throw error;
    });
  }

  Future<void> _refreshToken(String loginId, { bool tokenExpired }) async {
    var account = _accounts[loginId];
    if(account == null) {
      throw ErrorInfo(RspCode.NetworkLocal.NOT_LOGIN, "account not in processor", "");
    }

    if(account.isLocalUser) {
      throw ErrorInfo(RspCode.NetworkLocal.NOT_LOGIN, "account is local user", "");
    }

    if(tokenExpired == null) {
      tokenExpired = account.tokenInfo.tokens.loginUtc + account.tokenInfo.tokens.expiresIn <= DateTime.now().millisecondsSinceEpoch;
    }

    var request = HttpRequest(
      Method.POST,
      UrlFactory.getRefreshTokenUrl(account.userId, Account.terminalId),
      data: {
        "refreshToken": account.tokenInfo.tokens.refreshToken
      }
    );

    var loginUtc = DateTime.now().millisecondsSinceEpoch;
    var rsp = await execute(request);

    var tokenInfo = TokenInfo.fromJson(rsp.response);
    var accessToken = tokenInfo.tokens?.accessToken;
    if(accessToken == null || accessToken.isEmpty) {
      throw ErrorInfo(RspCode.NetworkLocal.RSP_INVALID_TOKEN, "token invalid in rsp", "");
    }

    tokenInfo.userId = account.userId;
    tokenInfo.tokens.loginUtc = loginUtc;
    account.tokenInfo = tokenInfo;

    _bus?.fire(TokenRefreshed(loginId));
  }

  Future<UserInfo> pullUserInfo(Account account, String userId) async {
    if(account == null || account.isLocalUser) {
      throw ErrorInfo(RspCode.NetworkLocal.NOT_LOGIN, "", "");
    }

    var request = HttpRequest(
      Method.GET,
      UrlFactory.getUserInfoUrl(userId),
      queryParams: {
        "accessToken": account.tokenInfo.tokens.accessToken
      }
    );

    var rsp = await execute(request);

    var userInfo = UserInfo.fromJson(rsp.response);

    {
      Account account = getByUserId(userId);
      if (account != null)
        account.userInfo = userInfo;
    }

    _bus?.fire(UserInfoUpdated(userId));
    return userInfo;
  }

  Future<void> updateUserInfo(String userId, UpdateUserInfo userInfo) async {

    var request = HttpRequest(
      Method.POST,
      UrlFactory.getUserInfoUrl(userId),
      data: userInfo.toJson()
    );

    await execute(request);

    _bus?.fire(UserInfoUpdated(userId));
  }

  Future<void> updateAvatar(AvatarUpdateInfo updateInfo) async {
    var request = HttpRequest(
        Method.POST,
        UrlFactory.getUserAvatarUrl(updateInfo.userId),
        data: updateInfo.toJson()
    );

    var rsp = await execute(request);

    var avatarUri = rsp.response["avatarUri"];
    if(avatarUri != null && avatarUri is String) {
      _accounts.entries.firstWhere(
        (element) => updateInfo.userId == element.value.userId
      )?.value?.userInfo?.baseInfo?.avatarUri = avatarUri;
    }
    _bus?.fire(UserAvatarUpdated(updateInfo.userId));
  }

  Future<void> retrievePassword(String loginId, RetrieveInfo retrieveInfo) async {
    if(retrieveInfo.env.envId == null) {
      retrieveInfo.env.envId = Account.terminalId;
    }
    var request = HttpRequest(
      Method.POST,
      UrlFactory.getRetrieveUrl(loginId),
      data: retrieveInfo.toJson()
    );

    await execute(request);
  }

  Future<void> changPassword(String userId, String accessToken,String oldPassword, String newPassword) async {
    var request = HttpRequest(
        Method.POST,
        UrlFactory.getChangePasswordUrl(userId),
        data: {
          "password": oldPassword,
          "newPassword": newPassword,
          "accessToken": accessToken,
        }
    );

    await execute(request);
  }

}