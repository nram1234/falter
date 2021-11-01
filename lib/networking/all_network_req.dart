import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:developer' as developer;

import 'jsonfile/getproduct_json.dart';
import 'jsonfile/home_json.dart';

class AllNetworkingReq {
  String paseurl = "https://flattery.sla-request.com/api/auth/";
  Dio _dio = Dio();
  var box = GetStorage();
String gettoken(){
return  box.read("access" );
}
  Future<HomeJson> home( ) async {
   var token=gettoken();
    HomeJson? data;
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer ${token}";
   var d= await _dio.get(paseurl + "home");
    //    .then((value) {
      box.write("homedata", d.data);
    //   print(value.data);
    //
    // });
   print(d.data);
   data=HomeJson.fromJson(d.data);
    return data;
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


  Future <GetProductJson>getproduct(String id) async {
    GetProductJson data;
var a=gettoken();
    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers["AUTHORIZATION"] = "Bearer ${a}";


   var d=await _dio.get(paseurl + "getProduct/$id");
    data=GetProductJson.fromJson(d.data);
   return data;


  }
}
