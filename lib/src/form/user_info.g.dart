// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['password']);
  return UserInfo()
    ..password = json['password'] as String?
    ..baseInfo = BaseInfo.fromJson(json['baseInfo'] as Map<String, dynamic>)
    ..extendInfo = json['extendInfo'] == null
        ? null
        : ExtendInfo.fromJson(json['extendInfo'] as Map<String, dynamic>)
    ..loginInfo = Login.fromJson(json['loginInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
  'password': ?instance.password,
  'baseInfo': instance.baseInfo,
  'extendInfo': ?instance.extendInfo,
  'loginInfo': instance.loginInfo,
};

BaseInfo _$BaseInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['nickName', 'gender', 'avatarUri', 'birthday'],
  );
  return BaseInfo()
    ..nickName = json['nickName'] as String?
    ..name = json['name'] as String?
    ..gender = json['gender'] as String
    ..avatarUri = json['avatarUri'] as String?
    ..birthday = (json['birthday'] as num).toInt();
}

Map<String, dynamic> _$BaseInfoToJson(BaseInfo instance) => <String, dynamic>{
  'nickName': ?instance.nickName,
  'name': ?instance.name,
  'gender': instance.gender,
  'avatarUri': ?instance.avatarUri,
  'birthday': instance.birthday,
};

ExtendInfo _$ExtendInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'lang',
      'region',
      'province',
      'city',
      'location',
    ],
  );
  return ExtendInfo()
    ..lang = json['lang'] as String?
    ..region = json['region'] as String?
    ..province = json['province'] as String?
    ..city = json['city'] as String?
    ..location = json['location'] as String?;
}

Map<String, dynamic> _$ExtendInfoToJson(ExtendInfo instance) =>
    <String, dynamic>{
      'lang': ?instance.lang,
      'region': ?instance.region,
      'province': ?instance.province,
      'city': ?instance.city,
      'location': ?instance.location,
    };

Login _$LoginFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['status', 'email', 'phone', 'createUtc', 'mfa'],
  );
  return Login()
    ..status = json['status'] as String
    ..email = json['email'] as String?
    ..phone = json['phone'] as String?
    ..createUtc = (json['createUtc'] as num).toInt()
    ..mfa = json['mfa'] as bool?;
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
  'status': instance.status,
  'email': ?instance.email,
  'phone': ?instance.phone,
  'createUtc': instance.createUtc,
  'mfa': ?instance.mfa,
};
