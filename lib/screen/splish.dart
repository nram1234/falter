import 'package:falter/screen/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'choose_scr.dart';

class Splish extends StatelessWidget {
  const Splish({Key? key}) : super(key: key);
goToHomeScreen(){
  Future.delayed(Duration(seconds: 3)).then((value) {
    Get.offAll(()=>Home());
  });

 }
  @override
  Widget build(BuildContext context) {
    goToHomeScreen();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(fit: StackFit.expand,
        children: [
          Positioned( top:  0,left: 0,right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              child: Image.asset(
                'assets/images/spli.png',  height: size.height*.85,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
      Positioned(bottom: 0,left: 0,right: 0,child: Image.asset(
        'assets/images/fulllogo.png',
         height: size.height*.4,
      ))],
      ),
    );
  }
}
