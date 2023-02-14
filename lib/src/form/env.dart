/*
 * Copyright (c) 2019-2023 OE Technology (Shenzhen) Co., Ltd. All Rights Reserved.
 * Copyright (c) 2019-2023 偶忆科技（深圳）有限公司. All Rights Reserved.
 */

import 'package:account/src/jsonable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'env.g.dart';

@JsonSerializable()
class Env implements Jsonable {
  @JsonKey(disallowNullValue: true)
  String? envId;
  @JsonKey(disallowNullValue: true)
  String? result;

  Env();

  @override
  Map<String, dynamic> toJson() => _$EnvToJson(this);

  factory Env.fromJson(Map<String, dynamic> json) => _$EnvFromJson(json);
}