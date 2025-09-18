// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorInfo _$ErrorInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['reason', 'errDispMsg']);
  return ErrorInfo(
    (json['rspCode'] as num?)?.toInt(),
    json['reason'] as String?,
    json['errDispMsg'] as String?,
  );
}

Map<String, dynamic> _$ErrorInfoToJson(ErrorInfo instance) => <String, dynamic>{
  'rspCode': instance.rspCode,
  'reason': instance.reason,
  'errDispMsg': instance.errDispMsg,
};
