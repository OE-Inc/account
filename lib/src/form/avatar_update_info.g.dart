// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_update_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvatarUpdateInfo _$AvatarUpdateInfoFromJson(Map<String, dynamic> json) =>
    AvatarUpdateInfo()
      ..userId = json['userId'] as String
      ..data = json['data'] as String
      ..accessToken = json['accessToken'] as String
      ..mime = json['mime'] as String
      ..encoding = json['encoding'] as String;

Map<String, dynamic> _$AvatarUpdateInfoToJson(AvatarUpdateInfo instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'data': instance.data,
      'accessToken': instance.accessToken,
      'mime': instance.mime,
      'encoding': instance.encoding,
    };
