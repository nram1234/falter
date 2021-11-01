import 'package:falter/controller/onlinecontroller.dart';
import 'package:falter/networking/all_network_req.dart';
import 'package:falter/networking/jsonfile/home_json.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Tap1ViewController extends GetxController {
  List<Products> data = [];
  AllNetworkingReq _allNetworkingReq = AllNetworkingReq();
  var box = GetStorage();
bool getdatafromweb=true;
  @override
  void onInit() {
    super.onInit();

    updatedata();
  }

  updatedata() async {
    // Get.find<OnlineNetWorkController>().initConnctivity();
    // if (Get.find<OnlineNetWorkController>().connectionStatus) {

      HomeJson homeJson = await _allNetworkingReq.home( );

      data = homeJson.data.products;
getdatafromweb=false;

      update();
    // } else {
    //   var d = box.read("homedata");
    //
    //   data = HomeJson.fromJson(d.data).data.products;
    // }
  }
}
