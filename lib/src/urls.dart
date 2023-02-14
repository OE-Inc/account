/*
 * Copyright (c) 2019-2023 OE Technology (Shenzhen) Co., Ltd. All Rights Reserved.
 * Copyright (c) 2019-2023 偶忆科技（深圳）有限公司. All Rights Reserved.
 */

import 'package:sprintf/sprintf.dart';

const String _OWNER = "/v2/environment/owner/%s";
const String _REGISTER = "/v2/user/loginIds/%s";
const String _LOGIN = "/v2/user/loginIds/%s/sessions/%s";
const String _LOGOUT = "/v2/user/users/%s/sessions/%s";
const String _REFRESH_TOKEN = "/v2/user/users/%s/sessions/%s/tokens";
const String _USER_INFO = "/v2/user/users/%s/info";
const String _RETRIEVE = "/v2/user/loginIds/%s/password";
const String _CHANGE_PASSWORD = "/v2/user/users/%s/password/";
const String _USER_AVATAR = "/v2/user/users/%s/avatar";

class UrlFactory {
  static String baseUrl = "https://api.oecore.com";

  static String getOwnerUrl(String terminalId) => _makeUrl(_OWNER, [terminalId]);

  static String getRegisterUrl(String loginId) => _makeUrl(_REGISTER, [loginId]);

  static String getLoginUrl(String loginId, String terminalId) => _makeUrl(_LOGIN, [loginId, terminalId]);

  static String getLogoutUrl(String userId, String terminalId) => _makeUrl(_LOGOUT, [userId, terminalId]);

  static String getRefreshTokenUrl(String userId, String terminalId) => _makeUrl(_REFRESH_TOKEN, [userId, terminalId]);

  static String getUserInfoUrl(String userId) => _makeUrl(_USER_INFO, [userId]);

  static String getRetrieveUrl(String loginId) => _makeUrl(_RETRIEVE, [loginId]);

  static String getChangePasswordUrl(String userId) => _makeUrl(_CHANGE_PASSWORD, [userId]);

  static String getUserAvatarUrl(String userId) => _makeUrl(_USER_AVATAR, [userId]);

  static String makeSimpleUrl(String relative) {
    return baseUrl + relative;
  }

  static String _makeUrl(String relative, var args) {
    return baseUrl + sprintf(relative, args);
  }


  static void setServerUrl(String url) {
    baseUrl = url;
  }

}