/*
 * Copyright (c) 2019-2023 OE Technology (Shenzhen) Co., Ltd. All Right Reserved.
 * Copyright (c) 2019-2023 偶忆科技（深圳）有限公司. All Right Reserved.
 */

import 'package:json_annotation/json_annotation.dart';

import '../jsonable.dart';
import 'env.dart';

part 'retrieve_info.g.dart';

@JsonSerializable()
class RetrieveInfo implements Jsonable {
  Env env = new Env();
  @JsonKey(disallowNullValue: true) String? password;
  @JsonKey(disallowNullValue: true) String? packageId;

  RetrieveInfo();

  @override
  Map<String, dynamic> toJson() => _$RetrieveInfoToJson(this);

  factory RetrieveInfo.fromJson(Map<String, dynamic> json) => _$RetrieveInfoFromJson(json);
}