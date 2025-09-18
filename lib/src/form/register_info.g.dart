// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterInfo _$RegisterInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['packageId']);
  return RegisterInfo()
    ..env = Env.fromJson(json['env'] as Map<String, dynamic>)
    ..newUserInfo = json['newUserInfo'] == null
        ? null
        : UserInfo.fromJson(json['newUserInfo'] as Map<String, dynamic>)
    ..packageId = json['packageId'] as String?;
}

Map<String, dynamic> _$RegisterInfoToJson(RegisterInfo instance) =>
    <String, dynamic>{
      'env': instance.env,
      'newUserInfo': instance.newUserInfo,
      'packageId': ?instance.packageId,
    };
