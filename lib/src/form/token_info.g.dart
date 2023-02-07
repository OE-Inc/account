// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenInfo _$TokenInfoFromJson(Map<String, dynamic> json) => TokenInfo()
  ..userId = json['userId'] as String
  ..tokens = Tokens.fromJson(json['tokens'] as Map<String, dynamic>);

Map<String, dynamic> _$TokenInfoToJson(TokenInfo instance) => <String, dynamic>{
      'userId': instance.userId,
      'tokens': instance.tokens,
    };

Tokens _$TokensFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'accessToken',
      'refreshToken',
      'permissions',
      'expiresIn',
      'loginUtc'
    ],
  );
  return Tokens()
    ..accessToken = json['accessToken'] as String?
    ..refreshToken = json['refreshToken'] as String?
    ..permissions = (json['permissions'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..expiresIn = json['expiresIn'] as int?
    ..loginUtc = json['loginUtc'] as int?;
}

Map<String, dynamic> _$TokensToJson(Tokens instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('refreshToken', instance.refreshToken);
  writeNotNull('permissions', instance.permissions);
  writeNotNull('expiresIn', instance.expiresIn);
  writeNotNull('loginUtc', instance.loginUtc);
  return val;
}
