// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['loginId', 'isLogin']);
  return Account(
    loginId: json['loginId'] as String,
  )
    ..isLogin = json['isLogin'] as bool
    ..userInfo = json['userInfo'] == null
        ? null
        : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>)
    ..tokenInfo = json['tokenInfo'] == null
        ? null
        : TokenInfo.fromJson(json['tokenInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AccountToJson(Account instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('loginId', instance.loginId);
  writeNotNull('isLogin', instance.isLogin);
  val['userInfo'] = instance.userInfo;
  val['tokenInfo'] = instance.tokenInfo;
  return val;
}
