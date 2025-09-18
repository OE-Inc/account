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
      'loginUtc',
    ],
  );
  return Tokens()
    ..accessToken = json['accessToken'] as String?
    ..refreshToken = json['refreshToken'] as String?
    ..permissions = (json['permissions'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..expiresIn = (json['expiresIn'] as num?)?.toInt()
    ..loginUtc = (json['loginUtc'] as num?)?.toInt();
}

Map<String, dynamic> _$TokensToJson(Tokens instance) => <String, dynamic>{
  'accessToken': ?instance.accessToken,
  'refreshToken': ?instance.refreshToken,
  'permissions': ?instance.permissions,
  'expiresIn': ?instance.expiresIn,
  'loginUtc': ?instance.loginUtc,
};
