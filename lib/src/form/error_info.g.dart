// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorInfo _$ErrorInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['reason', 'errDispMsg']);
  return ErrorInfo(
    json['rspCode'] as int,
    json['reason'] as String,
    json['errDispMsg'] as String,
  );
}

Map<String, dynamic> _$ErrorInfoToJson(ErrorInfo instance) {
  final val = <String, dynamic>{
    'rspCode': instance.rspCode,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reason', instance.reason);
  writeNotNull('errDispMsg', instance.errDispMsg);
  return val;
}
