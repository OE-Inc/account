// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'clientId',
      'packageId',
      'password',
      'termInfo',
      'pushInfo',
      'clientInfo'
    ],
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
    ..clientInfo =
        ClientInfo.fromJson(json['clientInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull('packageId', instance.packageId);
  writeNotNull('password', instance.password);
  val['termInfo'] = instance.termInfo;
  val['prefer'] = instance.prefer;
  writeNotNull('pushInfo', instance.pushInfo);
  val['clientInfo'] = instance.clientInfo;
  return val;
}

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
      'id'
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

Map<String, dynamic> _$TermInfoToJson(TermInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('os', instance.os);
  writeNotNull('ua', instance.ua);
  writeNotNull('v', instance.v);
  writeNotNull('rom', instance.rom);
  writeNotNull('manu', instance.manu);
  writeNotNull('model', instance.model);
  writeNotNull('ip', instance.ip);
  writeNotNull('id', instance.id);
  return val;
}

Prefer _$PreferFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['lang', 'region', 'tz'],
  );
  return Prefer()
    ..lang = json['lang'] as String?
    ..region = json['region'] as String?
    ..tz = json['tz'] as String?;
}

Map<String, dynamic> _$PreferToJson(Prefer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lang', instance.lang);
  writeNotNull('region', instance.region);
  writeNotNull('tz', instance.tz);
  return val;
}

PushInfo _$PushInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['type', 'token'],
  );
  return PushInfo()
    ..type = json['type'] as String?
    ..token = json['token'] as String?;
}

Map<String, dynamic> _$PushInfoToJson(PushInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('token', instance.token);
  return val;
}

ClientInfo _$ClientInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['app'],
  );
  return ClientInfo()
    ..account = AccountInfo.fromJson(json['account'] as Map<String, dynamic>)
    ..app = json['app'] == null
        ? null
        : App.fromJson(json['app'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ClientInfoToJson(ClientInfo instance) {
  final val = <String, dynamic>{
    'account': instance.account,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('app', instance.app);
  return val;
}

AccountInfo _$AccountInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['v'],
  );
  return AccountInfo()..v = json['v'] as String?;
}

Map<String, dynamic> _$AccountInfoToJson(AccountInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('v', instance.v);
  return val;
}

App _$AppFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['v', 'appId'],
  );
  return App()
    ..v = json['v'] as String?
    ..appId = json['appId'] as String?;
}

Map<String, dynamic> _$AppToJson(App instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('v', instance.v);
  writeNotNull('appId', instance.appId);
  return val;
}
