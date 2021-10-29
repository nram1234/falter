import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:developer' as developer;

import 'jsonfile/home_json.dart';

class AllNetworkingReq {
  String paseurl = "https://flattery.sla-request.com/api/auth/";
  Dio _dio = Dio();
  var box = GetStorage();
  Future<HomeJson> home({ required String token}) async {
    HomeJson? data;
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers["authorization"] = "token ${token}";
    await _dio.get(paseurl + "home").then((value) {
      box.write("homedata", value);
      print(value.data);
data=HomeJson.fromJson(value.data);
    });

    return data!;
  }

  Future logIn({required String email, required String password}) async {
    final formData = {
      "email": email,
      "password": password,
    };

    await _dio.post(paseurl + "login", queryParameters: formData).then((value) {
      print(value);
    });
  }

  Future register(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    final formData = {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
    };

   return await _dio.post(paseurl + "register", queryParameters: formData);
  }


  Future getproduct(String id) async {

   return await _dio.get(paseurl + "get-product/$id");


  }
}
