import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:falter/networking/jsonfile/home_json.dart';
import 'package:flutter/material.dart';

class ItemProdect extends StatelessWidget {
  final Products products;

  ItemProdect(this.products);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                child:CarouselSlider(
          options: CarouselOptions(height: 400.0),
      items: products.images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return CachedNetworkImage(imageUrl: i.,

              height: _size.height * .2,
              fit: BoxFit.fill,
            );
          },
        );
      }).toList(),
    )


                ,

              ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("name"), Text("price:100")],
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add_shopping_cart),
              ))
        ],
      ),
    );
  }
}
