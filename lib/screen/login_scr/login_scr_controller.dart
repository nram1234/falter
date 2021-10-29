import 'package:falter/networking/all_network_req.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogInViewController extends GetxController{
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();


  AllNetworkingReq _allNetworkingReq=AllNetworkingReq();



login()async{
  if(!username.text.isEmpty&&!password.text.isEmpty){
 var data=   _allNetworkingReq.logIn(email: username.text, password: password.text);
 print(data);
  }else{
    Get.snackbar('', 'برجاء ادخال البيانات');
  }
}


}