import 'package:falter/networking/all_network_req.dart';
import 'package:falter/networking/jsonfile/login_json.dart';
import 'package:falter/screen/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LogInViewController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  AllNetworkingReq _allNetworkingReq = AllNetworkingReq();

  RxBool  arlogin = false.obs;

  updatarlogin(bool data) {
    arlogin.value = data;

  }

  login() async {
    var box = GetStorage();
    if (!phone.text.isEmpty && !password.text.isEmpty) {

      try {
        updatarlogin(true);
        var data = await _allNetworkingReq
            .logIn(phone: phone.text, password: password.text);
        LoginJson _loginJson=LoginJson.fromJson(data.data);


        await box.write("access", _loginJson.data.accessToken);

        await  box.write("name", _loginJson.data.user.name);
        await  box.write("phone", _loginJson.data.user.phone);
        await  box.write("email", _loginJson.data.user.email);
        await  box.write("id", _loginJson.data.user.id);
        await  box.write("vip", _loginJson.data.user.vip);
        Get.snackbar('مرحبا', "تم تسجيل الدخول بنجاح");
        Get.offAll(() => Home());
      updatarlogin(false);
      } catch (e) {
        print(e);
        Get.snackbar('خطاء', "تاكد من بيانات المستخدم");
        updatarlogin(false);
      }
    } else {
      Get.snackbar('', 'برجاء ادخال البيانات');

      updatarlogin(false);
    }
  }
}
