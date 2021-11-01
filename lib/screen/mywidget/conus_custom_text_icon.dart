import 'package:falter/utilitie/utilitie.dart';
import 'package:flutter/material.dart';

class CounusCustomTextIcon extends StatelessWidget {
  String text;

  double size;
  String imag;
  FontWeight fontWeight;
  Function() ontap;

  CounusCustomTextIcon(
      {required this.ontap,
      required this.imag,
      required this.text,

      this.size = 16.0,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                  color: blackcolore, fontWeight: fontWeight, fontSize: size),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imag,
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
}
