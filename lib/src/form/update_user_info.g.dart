// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInfo _$UpdateUserInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'accessToken',
      'baseInfo',
      'extendInfo',
      'loginInfo',
    ],
  );
  return UpdateUserInfo()
    ..accessToken = json['accessToken'] as String?
    ..baseInfo = json['baseInfo'] == null
        ? null
        : BaseInfo.fromJson(json['baseInfo'] as Map<String, dynamic>)
    ..extendInfo = json['extendInfo'] == null
        ? null
        : ExtendInfo.fromJson(json['extendInfo'] as Map<String, dynamic>)
    ..loginInfo = json['loginInfo'] == null
        ? null
        : Login.fromJson(json['loginInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateUserInfoToJson(UpdateUserInfo instance) =>
    <String, dynamic>{
      'accessToken': ?instance.accessToken,
      'baseInfo': ?instance.baseInfo,
      'extendInfo': ?instance.extendInfo,
      'loginInfo': ?instance.loginInfo,
    };
