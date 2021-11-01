import 'package:falter/networking/all_network_req.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogInViewController extends GetxController{
  TextEditingController phone=TextEditingController();
  TextEditingController password=TextEditingController();


  AllNetworkingReq _allNetworkingReq=AllNetworkingReq();

bool arlogin=false;
updatarlogin(bool data){
 arlogin=true;
 update();
}

login()async{
  if(!phone.text.isEmpty&&!password.text.isEmpty){
 var data=   _allNetworkingReq.logIn(email: phone.text, password: password.text);
 print(data);
 updatarlogin(false);
  }else{
    Get.snackbar('', 'برجاء ادخال البيانات');
  }
}


}