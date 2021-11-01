import 'package:falter/screen/mywidget/conus_custom_text_icon.dart';
import 'package:falter/utilitie/utilitie.dart';
import 'package:flutter/material.dart';

class ConUsView extends StatefulWidget {
  @override
  _ConUsViewState createState() => _ConUsViewState();
}

class _ConUsViewState extends State<ConUsView> {

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarcolors,centerTitle: true,
        title: const Text('تواصل معنا'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/fulllogo.png',
                height: _size.height * .3,
              ),
              CounusCustomTextIcon(
                imag: 'assets/images/call.png',
                ontap: () {},
                text: '000 000 000',size: 20,fontWeight: FontWeight.bold,
              ),
              CounusCustomTextIcon(
                imag: 'assets/images/whats.png',
                ontap: () {},
                text: '000 000 000',size: 20,fontWeight: FontWeight.bold,
              ),
              CounusCustomTextIcon(
                imag: 'assets/images/face.png',
                ontap: () {},
                text: 'facebook',size: 20,fontWeight: FontWeight.bold,
              ),
              CounusCustomTextIcon(
                imag: 'assets/images/insta.png',
                ontap: () {},
                text: 'inasta',size: 20,fontWeight: FontWeight.bold,
              ),
              CounusCustomTextIcon(
                imag: 'assets/images/in.png',
                ontap: () {},
                text: '000 000 000',size: 20,fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
