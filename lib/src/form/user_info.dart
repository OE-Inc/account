import 'package:json_annotation/json_annotation.dart';

import '../constants.dart';
import '../jsonable.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo implements Jsonable {
  @JsonKey(disallowNullValue: true)
  String password;
  BaseInfo baseInfo = new BaseInfo();
  ExtendInfo extendInfo = new ExtendInfo();
  Login loginInfo = new Login();

  UserInfo();

  @override
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}

@JsonSerializable()
class BaseInfo implements Jsonable {
  @JsonKey(disallowNullValue: true) String nickName;
  @JsonKey(disallowNullValue: false) String name;
  @JsonKey(disallowNullValue: true) String gender = GENDER_UNKOWN;
  @JsonKey(disallowNullValue: true) String avatarUri;
  @JsonKey(disallowNullValue: true) int birthday = 0;

  BaseInfo();

  @override
  Map<String, dynamic> toJson() => _$BaseInfoToJson(this);

  factory BaseInfo.fromJson(Map<String, dynamic> json) => _$BaseInfoFromJson(json);
}

@JsonSerializable()
class ExtendInfo implements Jsonable {
  @JsonKey(disallowNullValue: true) String lang;
  @JsonKey(disallowNullValue: true) String region;
  @JsonKey(disallowNullValue: true) String province;
  @JsonKey(disallowNullValue: true) String city;
  @JsonKey(disallowNullValue: true) String location;

  ExtendInfo();

  @override
  Map<String, dynamic> toJson() => _$ExtendInfoToJson(this);

  factory ExtendInfo.fromJson(Map<String, dynamic> json) => _$ExtendInfoFromJson(json);
}

@JsonSerializable()
class Login implements Jsonable {
  @JsonKey(disallowNullValue: true) String status = STAT_NORMAL;
  @JsonKey(disallowNullValue: true) String email;
  @JsonKey(disallowNullValue: true) String phone;
  @JsonKey(disallowNullValue: true) int createUtc = 0;

  Login();

  @override
  Map<String, dynamic> toJson() => _$LoginToJson(this);

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}