// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['clientId', 'packageId', 'password', 'termInfo'],
  );
  return LoginInfo()
    ..clientId = json['clientId'] as String?
    ..packageId = json['packageId'] as String?
    ..password = json['password'] as String?
    ..termInfo = TermInfo.fromJson(json['termInfo'] as Map<String, dynamic>)
    ..prefer = Prefer.fromJson(json['prefer'] as Map<String, dynamic>)
    ..pushInfo = json['pushInfo'] == null
        ? null
        : PushInfo.fromJson(json['pushInfo'] as Map<String, dynamic>)
    ..clientInfo = json['clientInfo'] == null
        ? null
        : ClientInfo.fromJson(json['clientInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
  'clientId': ?instance.clientId,
  'packageId': ?instance.packageId,
  'password': ?instance.password,
  'termInfo': instance.termInfo,
  'prefer': instance.prefer,
  'pushInfo': ?instance.pushInfo,
  'clientInfo': ?instance.clientInfo,
};

TermInfo _$TermInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'name',
      'os',
      'ua',
      'v',
      'rom',
      'manu',
      'model',
      'ip',
      'id',
    ],
  );
  return TermInfo()
    ..name = json['name'] as String?
    ..os = json['os'] as String?
    ..ua = json['ua'] as String?
    ..v = json['v'] as String?
    ..rom = json['rom'] as String?
    ..manu = json['manu'] as String?
    ..model = json['model'] as String?
    ..ip = json['ip'] as String?
    ..id = json['id'] as String?;
}

Map<String, dynamic> _$TermInfoToJson(TermInfo instance) => <String, dynamic>{
  'name': ?instance.name,
  'os': ?instance.os,
  'ua': ?instance.ua,
  'v': ?instance.v,
  'rom': ?instance.rom,
  'manu': ?instance.manu,
  'model': ?instance.model,
  'ip': ?instance.ip,
  'id': ?instance.id,
};

Prefer _$PreferFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['lang', 'region', 'tz']);
  return Prefer()
    ..lang = json['lang'] as String?
    ..region = json['region'] as String?
    ..tz = json['tz'] as String?;
}

Map<String, dynamic> _$PreferToJson(Prefer instance) => <String, dynamic>{
  'lang': ?instance.lang,
  'region': ?instance.region,
  'tz': ?instance.tz,
};

PushInfo _$PushInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['type', 'token']);
  return PushInfo()
    ..type = json['type'] as String?
    ..token = json['token'] as String?;
}

Map<String, dynamic> _$PushInfoToJson(PushInfo instance) => <String, dynamic>{
  'type': ?instance.type,
  'token': ?instance.token,
};

ClientInfo _$ClientInfoFromJson(Map<String, dynamic> json) => ClientInfo()
  ..account = AccountInfo.fromJson(json['account'] as Map<String, dynamic>)
  ..app = json['app'] == null
      ? null
      : App.fromJson(json['app'] as Map<String, dynamic>);

Map<String, dynamic> _$ClientInfoToJson(ClientInfo instance) =>
    <String, dynamic>{'account': instance.account, 'app': ?instance.app};

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['v']);
  return AccountInfo()..v = json['v'] as String?;
}

Map<String, dynamic> _$AccountInfoToJson(AccountInfo instance) =>
    <String, dynamic>{'v': ?instance.v};

App _$AppFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['v', 'appId']);
  return App()
    ..v = json['v'] as String?
    ..appId = json['appId'] as String?;
}

Map<String, dynamic> _$AppToJson(App instance) => <String, dynamic>{
  'v': ?instance.v,
  'appId': ?instance.appId,
};
