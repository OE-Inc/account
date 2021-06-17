import 'package:json_annotation/json_annotation.dart';
import 'package:utils/utils.dart';
import 'package:uuid/uuid.dart';

import 'constants.dart';
import 'form/token_info.dart';
import 'form/user_info.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {

  static String terminalId = Uuid().v4();

  @JsonKey(disallowNullValue: true)
  String loginId;
  @JsonKey(disallowNullValue: true)
  bool isLogin = false;
  UserInfo userInfo = UserInfo();
  TokenInfo tokenInfo = TokenInfo();

  Account({this.loginId});

  bool get isValid => utc() - tokenInfo.tokens.loginUtc <= tokenInfo.tokens.expiresIn;

  bool get isReady => isLogin != false && STAT_NORMAL == userInfo.loginInfo.status;

  String get userId => tokenInfo.userId;

  String get accessToken => tokenInfo.tokens.accessToken;

  static String get clientId => "12345678-0000-0000-0000-000000000000";

  String get nickName => userInfo.baseInfo.nickName;
  String get name => userInfo.baseInfo.name;

  bool get isLocalUser => loginId == LOCAL_LOGIN_ID;

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  @override
  String toString() {
    return "$runtimeType { loginId: $loginId, isLogin: $isLogin, userInfo: ${userInfo.toJson()}, tokenInfo: ${tokenInfo.toJson()}, }";
  }
}