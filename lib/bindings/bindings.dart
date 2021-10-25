 import 'package:falter/screen/home/home_view_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViwController() );
  }

}