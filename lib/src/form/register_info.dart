/*
 * Copyright (c) 2019-2023 OE Technology (Shenzhen) Co., Ltd. All Rights Reserved.
 * Copyright (c) 2019-2023 偶忆科技（深圳）有限公司. All Rights Reserved.
 */

import 'package:json_annotation/json_annotation.dart';

import '../jsonable.dart';
import 'env.dart';
import 'user_info.dart';

part 'register_info.g.dart';

@JsonSerializable()
class RegisterInfo implements Jsonable {
  Env env = new Env();
  UserInfo? newUserInfo = new UserInfo();
  @JsonKey(disallowNullValue: true)
  String? packageId;

  RegisterInfo();

  @override
  Map<String, dynamic> toJson() => _$RegisterInfoToJson(this);

  factory RegisterInfo.fromJson(Map<String, dynamic> json) => _$RegisterInfoFromJson(json);
}