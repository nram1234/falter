import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<ItemViewController>(builder: (logic) {
        return logic.getdatafromweb
            ? CircularProgressIndicator()
            : Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(height: 400.0),
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
                  Text(logic.prodect!.data[0].name),
                  Text(logic.prodect!.data[0].price),
                  Text(logic.prodect!.data[0].desc),
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
