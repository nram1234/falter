import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:falter/screen/cart/cart_viewcontroller.dart';
import 'package:falter/utilitie/utilitie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'item_viewcontroller.dart';

class ItemView extends StatefulWidget {
  int id;

  ItemView(this.id);

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  CartViewController c = Get.find<CartViewController>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<ItemViewController>(builder: (logic) {
        return logic.getdatafromweb
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: _size.height * .3,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                    ),
                    items: logic.prodect!.data[0].images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return CachedNetworkImage(
                            imageUrl: i.path,
                            height: _size.height * .2,
                            fit: BoxFit.fill,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(() {
                                return InkWell(
                                    onTap: () {
                                      bool v = c.data.any(
                                          (element) => element.id == widget.id);
                                      if (v) {
                                        print("88");
                                        c.removeItemfromCartById(widget.id);
                                      } else {
                                        print("99");
                                        c.addItemtoCartById(widget.id);
                                      }

                                      print(c.data.any((element) =>
                                          element.id == widget.id));
                                    },
                                    child: Icon(
                                      Icons.add_shopping_cart,
                                      color: c.data.any((element) =>
                                              element.id == widget.id)
                                          ? appBarcolors
                                          : blackcolore,
                                    ));
                              }),
                            )),
                        Container(
                          height: 50,
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Text("0"),
                              Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      logic.prodect!.data[0].name,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      logic.prodect!.data[0].price,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      logic.prodect!.data[0].desc,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    Get.find<ItemViewController>().getDataOfItem(widget.id);
  }
}
