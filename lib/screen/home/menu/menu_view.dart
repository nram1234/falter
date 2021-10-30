import 'package:falter/screen/mywidget/custom_text.dart';
import 'package:falter/utilitie/utilitie.dart';
import 'package:flutter/material.dart';

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backmenubackground,
        body: Container(height: _size.height ,
          decoration: BoxDecoration(
            color: menubackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: _size.height * .1,
                  ),
                  Image.asset(
                    'assets/images/fulllogo.png',
                    height: _size.height * .3,
                  ),
                  CustomText(imag:'assets/images/aaa.png' ,
                    text: "الصفحة الرئيسية",
                    fontWeight: FontWeight.bold,
                    size: 20,
                    havedivider: true,
                  ),
                  CustomText(imag:'assets/images/hh.png' ,
                    text: "من نحن",
                    fontWeight: FontWeight.bold,
                    size: 20,
                    havedivider: true,
                  ),
                  CustomText(imag:'assets/images/i.png' ,
                    text: "تواصل معنا",
                    fontWeight: FontWeight.bold,
                    size: 20,
                    havedivider: true,
                  ),
                  CustomText(imag:'assets/images/c.png' ,
                    text: "سلة المشتريات",
                    fontWeight: FontWeight.bold,
                    size: 20,
                    havedivider: true,
                  ),
                  CustomText(imag:'assets/images/o.png' ,
                    text: "الصيانة الدورية",
                    fontWeight: FontWeight.bold,
                    size: 20,
                    havedivider: true,
                  ),
                  CustomText(imag:'assets/images/pp.png' ,
                    text: "بروفايل",
                    fontWeight: FontWeight.bold,
                    size: 20,
                    havedivider: true,
                  ), CustomText(imag:'assets/images/a.png' ,
                    text: "عقود الصيانة",
                    fontWeight: FontWeight.bold,
                    size: 20,
                    havedivider: true,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:   Image.asset(
                        'assets/images/s.png' ,
                        height: 50,width: 50,
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "تسجيل الخروج",
                          style: TextStyle(
                              color: textcolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}