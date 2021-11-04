import 'package:falter/networking/all_network_req.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Tab4Profile extends GetxController {

  AllNetworkingReq _allNetworkingReq = AllNetworkingReq();
  var box = GetStorage();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  RxBool arupdate = false.obs;

  @override
  void onInit() {
    super.onInit();
    name.text = box.read("name",);
    phone.text = box.read("phone");
    email.text = box.read("email");
    print(box.read("phone"));
  }

  // updatarprofile(bool data) {
  //   arupdate.value = data;
  // }

  updateUserProfile() {
    arupdate.value=true;
    _allNetworkingReq.userUpdate(
        name: name.text, email: email.text, phone: phone.text).then((value) {
      box.write("name",name.text);
       box.write("phone",phone.text);
   box.write("email",email.text);
          print(value);
          arupdate.value=false;
    });
  }
}