/*
 * Copyright (c) 2019-2023 OE Technology (Shenzhen) Co., Ltd. All Rights Reserved.
 * Copyright (c) 2019-2023 偶忆科技（深圳）有限公司. All Rights Reserved.
 */

import 'package:account/src/jsonable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_info.g.dart';

@JsonSerializable()
class LoginInfo implements Jsonable {
  @JsonKey(disallowNullValue: true) String? clientId;
  @JsonKey(disallowNullValue: true) String? packageId;
  @JsonKey(disallowNullValue: true) String? password;
  @JsonKey(disallowNullValue: true) TermInfo termInfo = new TermInfo();
  Prefer prefer = new Prefer();
  @JsonKey(disallowNullValue: false) PushInfo? pushInfo;
  @JsonKey(disallowNullValue: false) ClientInfo? clientInfo = new ClientInfo();

  LoginInfo();

  @override
  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);

  factory LoginInfo.fromJson(Map<String, dynamic> json) => _$LoginInfoFromJson(json);
}

@JsonSerializable()
class TermInfo implements Jsonable {

  @JsonKey(disallowNullValue: true) String? name;
  @JsonKey(disallowNullValue: true) String? os;
  @JsonKey(disallowNullValue: true) String? ua;
  @JsonKey(disallowNullValue: true) String? v;
  @JsonKey(disallowNullValue: true) String? rom;
  @JsonKey(disallowNullValue: true) String? manu;
  @JsonKey(disallowNullValue: true) String? model;
  @JsonKey(disallowNullValue: true) String? ip;
  @JsonKey(disallowNullValue: true) String? id;

  TermInfo();

  @override
  Map<String, dynamic> toJson() => _$TermInfoToJson(this);

  factory TermInfo.fromJson(Map<String, dynamic> json) => _$TermInfoFromJson(json);
}

@JsonSerializable()
class Prefer implements Jsonable {
  @JsonKey(disallowNullValue: true) String? lang;
  @JsonKey(disallowNullValue: true) String? region;
  @JsonKey(disallowNullValue: true) String? tz;

  Prefer();

  @override
  Map<String, dynamic> toJson() => _$PreferToJson(this);

  factory Prefer.fromJson(Map<String, dynamic> json) => _$PreferFromJson(json);
}

@JsonSerializable()
class PushInfo implements Jsonable {
  @JsonKey(disallowNullValue: true) String? type;
  @JsonKey(disallowNullValue: true) String? token;

  PushInfo();

  @override
  Map<String, dynamic> toJson() => _$PushInfoToJson(this);

  factory PushInfo.fromJson(Map<String, dynamic> json) => _$PushInfoFromJson(json);
}

@JsonSerializable()
class ClientInfo implements Jsonable {
  AccountInfo account = new AccountInfo();
  @JsonKey(disallowNullValue: false) App? app = new App();

  ClientInfo();

  @override
  Map<String, dynamic> toJson() => _$ClientInfoToJson(this);

  factory ClientInfo.fromJson(Map<String, dynamic> json) => _$ClientInfoFromJson(json);
}

@JsonSerializable()
class AccountInfo implements Jsonable {
  @JsonKey(disallowNullValue: true) String? v;

  AccountInfo();

  @override
  Map<String, dynamic> toJson() => _$AccountInfoToJson(this);

  factory AccountInfo.fromJson(Map<String, dynamic> json) => _$AccountInfoFromJson(json);
}

@JsonSerializable()
class App implements Jsonable {
  @JsonKey(disallowNullValue: true) String? v;
  @JsonKey(disallowNullValue: true) String? appId;

  App();

  @override
  Map<String, dynamic> toJson() => _$AppToJson(this);

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
}

