import 'dart:convert';

import 'package:account/src/account_processor.dart';
import 'package:account/src/form/env.dart';
import 'package:account/src/form/login_info.dart';
import 'package:account/src/form/register_info.dart';
import 'package:account/src/urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:account/src/account.dart';
import 'package:sprintf/sprintf.dart';
import 'package:uuid/uuid.dart';

void main() {
  test('', () {
    print(Uuid().v4());
    print(Uuid().v4());
    print(Uuid().v4());
    print(Uuid().v4());
  });

  test("sprintf", (){
    print(sprintf("%d,%s", [11, "haha"]));
  });

  test("dio", () async {
    Dio dio = Dio();
    var res = await dio.get("http://www.baidu.com");
    print(res);
  });

  test("owner", () async {
    var map = await AccountProcessor.processor.ownerValidate("authTo", packageId: "com.oecore.test");
    print(map);
  });
  
  test("json null", (){
    print(JsonEncoder().convert(Env()));
  });

  test("login", () async {
    var info = LoginInfo();
    info.password = "123456";
    var rsp = await AccountProcessor.processor.login("+86-17328768391", info);
  });

  test("env", () async {
    UrlFactory.baseUrl = "http://192.168.1.227";
    await AccountProcessor.processor.ownerValidate("authTo", packageId: "com.oe.platform.android.main");
    print("done");
  });

  test("register", () async {
    UrlFactory.baseUrl = "http://192.168.1.227";
    var info = RegisterInfo();
    info.newUserInfo.password = "123456";
    info.packageId = "com.oe.platform.android.main";
    info.env.envId = "604406c1-00ce-4f59-9240-b2c03a54b9df";
    info.env.result = "598072"; //owner请求的验证码
    var rsp = await AccountProcessor.processor.register("+86-17328768391", info);
    print("done");
  });

  test("refresh token", () async {
    await AccountProcessor.processor.refreshToken("loginId", tokenExpired: true);
  });

  test("change password", () async {
    await AccountProcessor.processor.changPassword("a892d8fb-8ab6-4f16-925c-6721fb4042a5", "b61ead43-1071-441b-bce0-7e48e9e539c2", "345678", "234567");
  });

  test("account serlize", () {
    var accounts = {
      "1": Account(loginId: "1"),
      "2": Account(loginId: "2"),
      "3": Account(loginId: "3"),
      "4": Account(loginId: "4"),
      "5": Account(loginId: "5"),
    };
    accounts.map((key, value) => MapEntry(key, value.toJson()));
    var json = JsonEncoder().convert(accounts);
    print(json);

    Map<String, dynamic> map = JsonDecoder().convert(json);
    map.forEach((key, value) {
      print(Account.fromJson(value).toJson());
    });
    
  });
}
