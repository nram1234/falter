import 'package:falter/networking/jsonfile/register_json.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController{
  Userdata? userdata;
  var box = GetStorage();
  String? _accessToken;
  @override
  void onInit()async {

      _accessToken=await box.read('accessToken');
      super.onInit();
  }
 String?  get registerUser =>_accessToken;
}

 