import 'package:falter/screen/home/itemdes/item_view.dart';
import 'package:falter/screen/mywidget/custmbutton.dart';
import 'package:falter/screen/mywidget/item_prodect.dart';
import 'package:falter/utilitie/utilitie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_viewcontroller.dart';

class CartView extends GetWidget<CartViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarcolors,
        centerTitle: true,
        title: const Text('سلة المشتريات'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Obx(() {
              return GridView.count(
                  crossAxisCount: 2,
                  children: controller.data
                      .map((e) =>
                      GestureDetector(
                          onTap: () {
                            print(e.id);
                          },
                          child: ItemProdect(e)))
                      .toList());
            }),
          ),
          Obx(() {
            return controller.sendData.value?const CircularProgressIndicator(): Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                  btcolor: buttonColor,
                  function: () {
                    controller.buyorder();
                  },
                  labcolor: textbuttonColor,
                  label: "شراء",
                  height: 50,
                  width: 100),
            );
          })
        ],
      ),
    );
  }
}
