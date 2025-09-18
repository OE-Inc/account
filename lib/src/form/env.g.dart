// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Env _$EnvFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['envId', 'result']);
  return Env()
    ..envId = json['envId'] as String?
    ..result = json['result'] as String?;
}

Map<String, dynamic> _$EnvToJson(Env instance) => <String, dynamic>{
  'envId': ?instance.envId,
  'result': ?instance.result,
};
