import 'package:falter/networking/all_network_req.dart';
import 'package:falter/networking/jsonfile/register_json.dart';
import 'package:falter/screen/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegisterScrController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController city = TextEditingController();

  AllNetworkingReq _allNetworkingReq = AllNetworkingReq();
  var box = GetStorage();
bool regist=false;
  register() async {
    if (!username.text.isEmpty &&
        !email.text.isEmpty &&
        !phone.text.isEmpty &&
        !password.text.isEmpty) {
      if (password.text == repassword.text) {
        updateregist(data: true);
        try {
          final data = await _allNetworkingReq.register(
              name: username.text,
              email: email.text,
              phone: phone.text,
              password: password.text);
          RegisterJson _registerJson = RegisterJson.fromJson(data);
         await box.write("accessToken", _registerJson.data.accessToken);
         print("accessToken   ${  _registerJson.data.accessToken}");
        await  box.write("name", _registerJson.data.userdata.name);
        await  box.write("phone", _registerJson.data.userdata.phone);
        await  box.write("email", _registerJson.data.userdata.email);
        await  box.write("id", _registerJson.data.userdata.id);
        await  box.write("vip", _registerJson.data.userdata.vip);
        await  box.write("createdAt", _registerJson.data.userdata.createdAt);
        await  box.write("updatedAt", _registerJson.data.userdata.updatedAt);
          Get.snackbar('نجاح', 'لقد تم التسجيل بنجاح');
          Get.to(() => Home());
        } catch (e) {
          Get.snackbar('خطاء', 'بيانات المستخدم موجوده مسبقا');
        }
      } else {
        Get.snackbar('خطاء', 'كلمه السر غير متطابقة');
      }
    } else {
      Get.snackbar('خطاء', 'برجاء ادخال البيانات');
    }
    updateregist(data: false); }

  updateregist({ required bool data}){
    regist=data;
    update();
  }
}
