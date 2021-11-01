 import 'package:falter/controller/onlinecontroller.dart';
import 'package:falter/controller/user_controller.dart';
import 'package:falter/screen/home/home_view_controller.dart';
import 'package:falter/screen/home/itemdes/item_viewcontroller.dart';
import 'package:falter/screen/home/tap1/tap1viewcontroller.dart';
import 'package:falter/screen/login_scr/login_scr_controller.dart';
import 'package:falter/screen/register/register_scr_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(() => UserController() );
    Get.lazyPut(() => HomeViwController() ,fenix: true);
    Get.lazyPut(() => Tap1ViewController() ,fenix: true);

    Get.lazyPut(() => RegisterScrController() );
    Get.lazyPut(() => LogInViewController() );


    Get.lazyPut(() => ItemViewController() );
    Get.lazyPut(() => OnlineNetWorkController() );

  }

}