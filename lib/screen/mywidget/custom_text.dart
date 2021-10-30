import 'package:falter/utilitie/utilitie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
String text;
bool havedivider;
double size;
String imag;
FontWeight fontWeight;
CustomText({required this.imag,required this.text,this.havedivider=false, this.size=16.0,this.fontWeight=FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end,//mainAxisSize: MainAxisSize.max,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:   Image.asset(
               imag,
                height: 50,width: 50,
              ),
            ), Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text,style: TextStyle(color: textcolor,fontWeight:fontWeight,fontSize: size ),),
            ),
          ],
        ),
    Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(height: 1,color:textcolor ,),
        )
      ],
    );
  }
}
