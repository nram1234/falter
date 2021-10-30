import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // CarouselSlider(
          //   options: CarouselOptions(height: 400.0),
          //   items: products.images.map((i) {
          //     return Builder(
          //       builder: (BuildContext context) {
          //         return CachedNetworkImage(
          //           imageUrl: i.fileName,
          //           height: _size.height * .2,
          //           fit: BoxFit.fill,
          //         );
          //       },
          //     );
          //   }).toList(),
          // ),
        Text(''),Text(''),],
      ),
    );
  }
}
