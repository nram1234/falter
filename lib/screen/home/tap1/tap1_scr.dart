import 'package:falter/screen/mywidget/item_prodect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tap1viewcontroller.dart';

class Tap1Scr extends StatefulWidget {


  @override
  _Tap1ScrState createState() => _Tap1ScrState();
}

class _Tap1ScrState extends State<Tap1Scr> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Tap1ViewController>(builder: (logic) {
      return GridView.count(
          crossAxisCount: 2, children: logic.data.map((e) => ItemProdect(e)).toList());
    });
  }
}
