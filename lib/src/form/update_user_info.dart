import 'package:json_annotation/json_annotation.dart';

import 'user_info.dart';

part 'update_user_info.g.dart';
@JsonSerializable()
class UpdateUserInfo {
  @JsonKey(disallowNullValue: true) String? accessToken;
  @JsonKey(disallowNullValue: true) BaseInfo? baseInfo;
  @JsonKey(disallowNullValue: true) ExtendInfo? extendInfo;
  @JsonKey(disallowNullValue: true) Login? loginInfo;
  UpdateUserInfo();

  factory UpdateUserInfo.fromJson(Map<String,dynamic> json) => _$UpdateUserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserInfoToJson(this);
}