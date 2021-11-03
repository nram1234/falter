
import 'package:falter/networking/all_network_req.dart';
import 'package:falter/networking/jsonfile/home_json.dart';
import 'package:falter/screen/home/tap1/tap1viewcontroller.dart';
import 'package:get/get.dart';

class CartViewController extends GetxController{
  RxList<Products>  data = RxList<Products>();
  Tap1ViewController _tap1viewController=Get.find<Tap1ViewController>();
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
  removeItemFromCartByItem(Products item){
     data.remove(item);
    update();
  }
  removeItemfromCartById(int id){
    print('iiiiiiiiiiiiiiiiii${data.length}');
    Products? a;
    data.forEach((element) {
      if(element.id==id){
        a=element;

      }
    });
    if(a!=null){
      data.remove(a);
    }
    update();
  }
  addItemtoCartById(int id){
  print('iiiiiiiiiiiiiiiiii${ _tap1viewController.    data.length}');
    Products? a;

  _tap1viewController.    data.forEach((element) {
      print( 'bef');
      if(element.id==id){
        print( 'getit');
        a=element;

      }
    });
    if(a!=null){
      data.add(a!);
    }
    update();
  }
}