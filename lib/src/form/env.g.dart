// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Env _$EnvFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['envId', 'result']);
  return Env()
    ..envId = json['envId'] as String
    ..result = json['result'] as String;
}

Map<String, dynamic> _$EnvToJson(Env instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('envId', instance.envId);
  writeNotNull('result', instance.result);
  return val;
}
