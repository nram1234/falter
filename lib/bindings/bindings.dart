 import 'package:falter/controller/onlinecontroller.dart';
import 'package:falter/controller/user_controller.dart';
import 'package:falter/screen/cart/cart_viewcontroller.dart';
import 'package:falter/screen/home/home_view_controller.dart';
import 'package:falter/screen/home/itemdes/item_viewcontroller.dart';
import 'package:falter/screen/home/tap1/tap1viewcontroller.dart';
import 'package:falter/screen/home/tap4profile/tap4viewcontroller.dart';
import 'package:falter/screen/login_scr/login_scr_controller.dart';
import 'package:falter/screen/menu/menu_viewcontroller.dart';
import 'package:falter/screen/register/register_scr_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(() => UserController() );
    Get.lazyPut(() => HomeViwController() ,fenix: true);
    Get.lazyPut(() => Tap1ViewController() ,fenix: true);
    Get.lazyPut(() => Tab4Profile() );

    Get.lazyPut(() => CartViewController(),fenix: true  );
    Get.lazyPut(() => RegisterScrController() );
    Get.lazyPut(() => LogInViewController() );


    Get.lazyPut(() => MenuViewController(),fenix: true );
    Get.lazyPut(() => ItemViewController() ,fenix: true );
    Get.lazyPut(() => OnlineNetWorkController(),   );

  }

}