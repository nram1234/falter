import 'package:falter/screen/login_scr/login_scr.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MenuViewController extends GetxController{
  var box = GetStorage();
  logout()async{

    await box.remove("access");

    await  box.remove("name" );
    await  box.remove("phone" );
    await  box.remove("email" );
    await  box.remove("id" );
    await  box.remove("vip");
    Get.offAll(()=>LogInScr());
  }
}