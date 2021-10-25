import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_view_controller.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeViwController>(builder: (logic) {
        return logic.currentScreen;
      }), //init: HomeViwController(),
      bottomNavigationBar: GetBuilder<HomeViwController>(builder: (logic) {
        return WaterDropNavBar(
          // bottomPadding: 8.0, for android maybe, test by yourself what is suitable
          backgroundColor: Colors.white,
          onItemSelected: logic.changeSelectedValue ,
          selectedIndex: logic.navigatorValue,
          barItems: [
            BarItem(
              filledIcon: Icons.home,
              outlinedIcon: Icons.home_outlined,
            ),
            BarItem(filledIcon: Icons.sell, outlinedIcon: Icons.sell_outlined),
            BarItem(
              filledIcon: Icons.wysiwyg,
              outlinedIcon: Icons.wysiwyg_outlined,
            ),
            BarItem(
              filledIcon: Icons.person_rounded,
              outlinedIcon: Icons.person_outline,
            ),
          ],
        );
      }),
    );
  }
}
