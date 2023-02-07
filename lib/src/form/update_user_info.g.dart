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
      'loginInfo'
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

Map<String, dynamic> _$UpdateUserInfoToJson(UpdateUserInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('baseInfo', instance.baseInfo);
  writeNotNull('extendInfo', instance.extendInfo);
  writeNotNull('loginInfo', instance.loginInfo);
  return val;
}
