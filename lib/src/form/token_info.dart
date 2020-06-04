import 'package:json_annotation/json_annotation.dart';

import '../jsonable.dart';

part 'token_info.g.dart';

@JsonSerializable()
class TokenInfo implements Jsonable {

  String userId = "00000000-0000-0000-0000-000000000000";
  Tokens tokens = new Tokens();

  TokenInfo();

  @override
  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);

  factory TokenInfo.fromJson(Map<String, dynamic> json) => _$TokenInfoFromJson(json);
}

@JsonSerializable()
class Tokens implements Jsonable {
  @JsonKey(disallowNullValue: true) String accessToken;
  @JsonKey(disallowNullValue: true) String refreshToken;
  @JsonKey(disallowNullValue: true) List<String> permissions;
  @JsonKey(disallowNullValue: true) int expiresIn;
  @JsonKey(disallowNullValue: true) int loginUtc = DateTime.now().millisecondsSinceEpoch;

  Tokens();

  @override
  Map<String, dynamic> toJson() => _$TokensToJson(this);

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
}