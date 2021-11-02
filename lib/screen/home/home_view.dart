import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_view_controller.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';


class Home extends GetWidget<HomeViwController>  {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return WillPopScope(onWillPop: ()async{
      final isFirstRouteInCurrentTab =
      !await controller.navigatorKeys[controller.currentPage].currentState.maybePop();
      print(isFirstRouteInCurrentTab);
      if (isFirstRouteInCurrentTab) {
        if (controller.currentPage != "Page1") {
          controller.changeSelectedValue(  0 );

          return false;
        }
      }
      print(isFirstRouteInCurrentTab);
      // let system handle back button if we're on the first route
      return isFirstRouteInCurrentTab;
    },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/fulllogo.png',
                      height: 50,
                      width: size.width*.1,
                    ),
                    Container(width:   size.width*.75,height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: const Color(0xFF1381CA).withOpacity(0.19),
                      ),
                    )
                   , InkWell(onTap:(){
                     Get.find<HomeViwController>().gotomun();
                    } ,
                     child: Image.asset(
                        'assets/images/mun.png',
                        height: 50,
                        width: size.width*.1,
                      ),
                   ),  ],
                ),
              ),
              Expanded(
                child://controller.currentScreen
                  GetBuilder<HomeViwController>(builder: (logic) {
                  return logic.currentScreen;
                }),
              ),
            ],
          ), //init: HomeViwController(),
          bottomNavigationBar:
          // WaterDropNavBar(
          //   // bottomPadding: 8.0, for android maybe, test by yourself what is suitable
          //   backgroundColor: Colors.white,
          //   onItemSelected: controller.changeSelectedValue,
          //   selectedIndex: controller.navigatorValue,
          //   barItems: [
          //     BarItem(
          //       filledIcon: Icons.home,
          //       outlinedIcon: Icons.home_outlined,
          //     ),
          //     BarItem(filledIcon: Icons.sell, outlinedIcon: Icons.sell_outlined),
          //     BarItem(
          //       filledIcon: Icons.wysiwyg,
          //       outlinedIcon: Icons.wysiwyg_outlined,
          //     ),
          //     BarItem(
          //       filledIcon: Icons.person_rounded,
          //       outlinedIcon: Icons.person_outline,
          //     ),
          //   ],
          // )
          GetBuilder<HomeViwController>(builder: (logic) {
            return WaterDropNavBar(
              // bottomPadding: 8.0, for android maybe, test by yourself what is suitable
              backgroundColor: Colors.white,
              onItemSelected: controller.changeSelectedValue,
              selectedIndex: controller.navigatorValue,
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
        ),
      ),
    );
  }
}
