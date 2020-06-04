import 'package:account/src/jsonable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avatar_update_info.g.dart';

@JsonSerializable()
class AvatarUpdateInfo implements Jsonable {

  String userId = null;
  String data = null;
  String accessToken = null;
  String mime = null;
  String encoding = "base64";

  AvatarUpdateInfo();

  @override
  Map<String, dynamic> toJson() => _$AvatarUpdateInfoToJson(this);

  factory AvatarUpdateInfo.fromJson(Map<String, dynamic> json) => _$AvatarUpdateInfoFromJson(json);
}