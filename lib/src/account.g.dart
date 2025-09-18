// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['loginId', 'isLogin']);
  return Account(loginId: json['loginId'] as String?)
    ..isLogin = json['isLogin'] as bool
    ..userInfo = UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>)
    ..tokenInfo = TokenInfo.fromJson(json['tokenInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
  'loginId': ?instance.loginId,
  'isLogin': instance.isLogin,
  'userInfo': instance.userInfo,
  'tokenInfo': instance.tokenInfo,
};
