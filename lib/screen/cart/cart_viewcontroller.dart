
import 'package:falter/networking/all_network_req.dart';
import 'package:falter/networking/jsonfile/home_json.dart';
import 'package:get/get.dart';

class CartViewController extends GetxController{
  RxList<Products>  data = RxList<Products>();
RxBool sendData=false.obs;
  AllNetworkingReq _allNetworkingReq = AllNetworkingReq();
buyorder()async{
  sendData.value=true;
 await _allNetworkingReq.makeOrder(ids: [3,4]);
  sendData.value=false;
}

  addItemToCart(Products item){
     data.add(item);
    update();
  }
  removeItemToCart(Products item){
     data.remove(item);
    update();
  }
}