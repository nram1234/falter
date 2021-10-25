import 'package:flutter/material.dart';

import 'mywidget/custmbutton.dart';

class ChooseScr extends StatelessWidget {
  const ChooseScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Image.asset(
                'assets/images/log2.png',
                height: size.height * .35,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * .5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF0A5290),
                  const Color(0xFFCFDEEE).withOpacity(0.0)
                ],
              ),
            ),
          ),
          Positioned(
              top: size.height * .2,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/fulllogo.png',
                height: size.height * .25,
              )),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: size.height*.1,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(fontSize: 20,fontWeight: FontWeight.bold,
                    height: size.height * .1,
                    width: size.width * .7,
                    label: "المتجر",
                    btcolor: Colors.white,
                    labcolor: Colors.blue,
                  ),
                )
             ,   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(fontSize: 20,fontWeight: FontWeight.bold,
                    height: size.height * .1,
                    width: size.width * .7,
                    label: "خدمي",
                    btcolor: Colors.white,
                    labcolor: Colors.blue,
                  ),
                ) ],
            ),
          )
        ],
      ),
    );
  }
}
