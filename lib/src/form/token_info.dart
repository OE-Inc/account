/*
 * Copyright (c) 2019-2023 OE Technology (Shenzhen) Co., Ltd. All Rights Reserved.
 * Copyright (c) 2019-2023 偶忆科技（深圳）有限公司. All Rights Reserved.
 */

import 'package:json_annotation/json_annotation.dart';

import '../jsonable.dart';

part 'token_info.g.dart';

@JsonSerializable()
class TokenInfo implements Jsonable {

  String userId = "00000000-0000-0000-0000-000000000000";
  @JsonKey(disallowNullValue: false) Tokens tokens = Tokens();

  TokenInfo();

  @override
  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);

  factory TokenInfo.fromJson(Map<String, dynamic> json) => _$TokenInfoFromJson(json);
}

@JsonSerializable()
class Tokens implements Jsonable {
  @JsonKey(disallowNullValue: true) String? accessToken;
  @JsonKey(disallowNullValue: true) String? refreshToken;
  @JsonKey(disallowNullValue: true) List<String>? permissions;
  @JsonKey(disallowNullValue: true) int? expiresIn = 0;
  @JsonKey(disallowNullValue: true) int? loginUtc = 0;

  Tokens();

  @override
  Map<String, dynamic> toJson() => _$TokensToJson(this);

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
}