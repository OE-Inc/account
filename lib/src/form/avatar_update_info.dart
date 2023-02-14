/*
 * Copyright (c) 2019-2023 OE Technology (Shenzhen) Co., Ltd. All Rights Reserved.
 * Copyright (c) 2019-2023 偶忆科技（深圳）有限公司. All Rights Reserved.
 */

import 'package:account/src/jsonable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avatar_update_info.g.dart';

@JsonSerializable()
class AvatarUpdateInfo implements Jsonable {

  late String userId;
  late String data;
  late String accessToken;
  late String mime;
  String encoding = "base64";

  AvatarUpdateInfo();

  @override
  Map<String, dynamic> toJson() => _$AvatarUpdateInfoToJson(this);

  factory AvatarUpdateInfo.fromJson(Map<String, dynamic> json) => _$AvatarUpdateInfoFromJson(json);
}