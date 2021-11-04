import 'package:falter/my_custom_data_type/cart_item_data_type.dart';
import 'package:falter/networking/all_network_req.dart';
import 'package:falter/networking/jsonfile/home_json.dart';
import 'package:falter/screen/home/tap1/tap1viewcontroller.dart';
import 'package:get/get.dart';

class CartViewController extends GetxController {
  RxList<Products> data = RxList<Products>();

  late Map<int, CartItemDataType> itemincardwillsendtoweb = {};
  Tap1ViewController _tap1viewController = Get.find<Tap1ViewController>();
  RxBool sendData = false.obs;
  AllNetworkingReq _allNetworkingReq = AllNetworkingReq();
RxDouble totalprice=0.0.obs;
  buyorder() async {
    sendData.value = true;
List i=[];
itemincardwillsendtoweb.forEach((key, value) {
  i.add(value.toMap());
});
 
    await _allNetworkingReq.makeOrder(ids:i);
    sendData.value = false;
  }

  addItemToCart(Products item) {
    data.add(item);
   

    update();
  }

  additemincardwillsendtoweb(Products item) {

    itemincardwillsendtoweb[item.id] = CartItemDataType(qt: 1, id: item.id,price:double.parse(item.price.split(" ")[0].replaceAll(",", "")));
    getTotalprice();
    update();
  }

  removeitemincardwillsendtoweb(Products item) {
    itemincardwillsendtoweb.remove(item.id);
    getTotalprice();
    update();
  }

  removeItemFromCartByItem(Products item) {
    data.remove(item);
    itemincardwillsendtoweb.remove(item.id);
    update();
  }

  removeItemfromCartById(int id) {
    Products? a;
    data.forEach((element) {
      if (element.id == id) {
        a = element;
      }
    });
    if (a != null) {
      data.remove(a);
    }
    removeitemincardwillsendtoweb(a!);
    update();
  }

  addItemtoCartById(int id) {
    Products? a;

    _tap1viewController.data.forEach((element) {
      if (element.id == id) {
        a = element;
      }
    });
    if (a != null) {
      data.add(a!);
      additemincardwillsendtoweb(a!);
    }
    update();
  }

  incrementQTtoitem({required int id}) {
    if (itemincardwillsendtoweb[id] != null) {
      itemincardwillsendtoweb[id]!.qt = itemincardwillsendtoweb[id]!.qt + 1;
    }
    getTotalprice();
    //
    update();
  }

  decrementQTtoitem({required int id}) {
    if (itemincardwillsendtoweb[id] != null) {
      if (itemincardwillsendtoweb[id]!.qt > 1) {
        itemincardwillsendtoweb[id]!.qt--;
      }
    }
    getTotalprice();
    update();
  }
  getTotalprice(){
   totalprice.value=0;
   itemincardwillsendtoweb.forEach((key, value) {
     totalprice.value+=value.price*value.qt;
   });
  }
}
