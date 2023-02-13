/*
 * Copyright (c) 2019-2023 OE Technology (Shenzhen) Co., Ltd. All Right Reserved.
 * Copyright (c) 2019-2023 偶忆科技（深圳）有限公司. All Right Reserved.
 */

import 'package:json_annotation/json_annotation.dart';

import '../jsonable.dart';

part 'error_info.g.dart';

@JsonSerializable()
class ErrorInfo extends Error implements Jsonable {
  int? rspCode = 99999999;
  @JsonKey(disallowNullValue: true)
  String reason = "";
  @JsonKey(disallowNullValue: true)
  String errDispMsg = "";

  ErrorInfo(this.rspCode, this.reason, this.errDispMsg);

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => _$ErrorInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ErrorInfoToJson(this);

  @override
  String toString() => "$runtimeType ${toJson().toString()}\n$stackTrace";
}

