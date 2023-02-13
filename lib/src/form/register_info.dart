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