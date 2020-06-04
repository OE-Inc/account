import 'dart:convert';

import 'package:account/src/account_processor.dart';
import 'package:account/src/form/env.dart';
import 'package:account/src/form/login_info.dart';
import 'package:account/src/form/register_info.dart';
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
    var rsp = await AccountProcessor.processor.login("+86-18825171975", info);
  });

  test("register", () async {
    var info = RegisterInfo();
    info.env.result = "123456"; //owner请求的验证码
    var rsp = await AccountProcessor.processor.register("+86-18825171975", info).catchError((error) => print(error));
    print("done");
  });

  test("refresh token", () async {
    await AccountProcessor.processor.refreshToken("loginId", tokenExpired: true).catchError((e) => print(e));
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
