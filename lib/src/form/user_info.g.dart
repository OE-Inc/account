// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['password'],
  );
  return UserInfo()
    ..password = json['password'] as String?
    ..baseInfo = BaseInfo.fromJson(json['baseInfo'] as Map<String, dynamic>)
    ..extendInfo = json['extendInfo'] == null
        ? null
        : ExtendInfo.fromJson(json['extendInfo'] as Map<String, dynamic>)
    ..loginInfo = Login.fromJson(json['loginInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  val['baseInfo'] = instance.baseInfo;
  writeNotNull('extendInfo', instance.extendInfo);
  val['loginInfo'] = instance.loginInfo;
  return val;
}

BaseInfo _$BaseInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['nickName', 'gender', 'avatarUri', 'birthday'],
  );
  return BaseInfo()
    ..nickName = json['nickName'] as String?
    ..name = json['name'] as String?
    ..gender = json['gender'] as String
    ..avatarUri = json['avatarUri'] as String?
    ..birthday = json['birthday'] as int;
}

Map<String, dynamic> _$BaseInfoToJson(BaseInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nickName', instance.nickName);
  writeNotNull('name', instance.name);
  val['gender'] = instance.gender;
  writeNotNull('avatarUri', instance.avatarUri);
  val['birthday'] = instance.birthday;
  return val;
}

ExtendInfo _$ExtendInfoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'lang',
      'region',
      'province',
      'city',
      'location'
    ],
  );
  return ExtendInfo()
    ..lang = json['lang'] as String?
    ..region = json['region'] as String?
    ..province = json['province'] as String?
    ..city = json['city'] as String?
    ..location = json['location'] as String?;
}

Map<String, dynamic> _$ExtendInfoToJson(ExtendInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lang', instance.lang);
  writeNotNull('region', instance.region);
  writeNotNull('province', instance.province);
  writeNotNull('city', instance.city);
  writeNotNull('location', instance.location);
  return val;
}

Login _$LoginFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['status', 'email', 'phone', 'createUtc'],
  );
  return Login()
    ..status = json['status'] as String
    ..email = json['email'] as String?
    ..phone = json['phone'] as String?
    ..createUtc = json['createUtc'] as int;
}

Map<String, dynamic> _$LoginToJson(Login instance) {
  final val = <String, dynamic>{
    'status': instance.status,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  val['createUtc'] = instance.createUtc;
  return val;
}
