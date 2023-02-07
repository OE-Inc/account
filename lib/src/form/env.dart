import 'package:account/src/jsonable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'env.g.dart';

@JsonSerializable()
class Env implements Jsonable {
  @JsonKey(disallowNullValue: true)
  String? envId;
  @JsonKey(disallowNullValue: true)
  String? result;

  Env();

  @override
  Map<String, dynamic> toJson() => _$EnvToJson(this);

  factory Env.fromJson(Map<String, dynamic> json) => _$EnvFromJson(json);
}