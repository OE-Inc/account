import 'package:json_annotation/json_annotation.dart';

import '../jsonable.dart';

part 'error_info.g.dart';

@JsonSerializable()
class ErrorInfo extends Error implements Jsonable {
  int rspCode = 99999999;
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

