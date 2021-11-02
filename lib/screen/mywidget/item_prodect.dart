import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:falter/networking/jsonfile/home_json.dart';
import 'package:falter/screen/cart/cart_viewcontroller.dart';
import 'package:falter/utilitie/utilitie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemProdect extends StatelessWidget {
  final Products products;

  ItemProdect(this.products);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery
        .of(context)
        .size;
    CartViewController c = Get.find<CartViewController>();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: _size.height * .25,
                    autoPlay: true,
                  ),
                  items: products.images!.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return CachedNetworkImage(
                          imageUrl: i.path,
                          height: _size.height * .18,
                        );
                      },
                    );
                  }).toList(),
                ),
                if (products.offer == 1)
                  Positioned(
                      top: 5,
                      left: 5,
                      child: Image.asset(
                        'assets/images/percent.png',
                        height: 50,
                        width: 50,
                      ))
              ],
            ),
          ),
          Text(products.name),
          Text("price:${products.price}")
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [Container(child: Text(products.name)), Container(child: Text("price:${products.price}"))],
          //   ),
          // )
          ,
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() {
                  return InkWell(
                      onTap: () {
                        c.data.contains(products)
                            ? c.data.remove(products)
                            : c.data.add(products);
                      },
                      child: Icon(Icons.add_shopping_cart,
                        color: c.data.contains(products)
                            ? appBarcolors
                            : blackcolore,));
                }),
              ))
        ],
      ),
    );
  }
}
