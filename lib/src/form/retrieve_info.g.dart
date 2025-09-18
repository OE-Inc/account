// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetrieveInfo _$RetrieveInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['password', 'packageId']);
  return RetrieveInfo()
    ..env = Env.fromJson(json['env'] as Map<String, dynamic>)
    ..password = json['password'] as String?
    ..packageId = json['packageId'] as String?;
}

Map<String, dynamic> _$RetrieveInfoToJson(RetrieveInfo instance) =>
    <String, dynamic>{
      'env': instance.env,
      'password': ?instance.password,
      'packageId': ?instance.packageId,
    };
