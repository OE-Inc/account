import 'package:json_annotation/json_annotation.dart';

import '../jsonable.dart';
import 'env.dart';

part 'retrieve_info.g.dart';

@JsonSerializable()
class RetrieveInfo implements Jsonable {
  Env env = new Env();
  @JsonKey(disallowNullValue: true) String password;
  @JsonKey(disallowNullValue: true) String packageId;

  RetrieveInfo();

  @override
  Map<String, dynamic> toJson() => _$RetrieveInfoToJson(this);

  factory RetrieveInfo.fromJson(Map<String, dynamic> json) => _$RetrieveInfoFromJson(json);
}