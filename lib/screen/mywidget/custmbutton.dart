import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color btcolor;
  final Color labcolor;
  final String label;
  final double height;
  final double width;
double fontSize;
FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO: onTap Rectangle 39
        print('onTap Rectangle 39');
      },
      child: Container(
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: labcolor,fontSize: fontSize,fontWeight: fontWeight
            ),
          ),
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.0),
          color: btcolor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.16),
              offset: Offset(0, 3.0),
              blurRadius: 6.0,
            ),
          ],
        ),
      ),
    );
  }

  CustomButton(
      {required this.btcolor,
      required this.labcolor,
      required this.label,
      required this.height,
      required this.width,this.fontSize=16,this.fontWeight=FontWeight.normal});
}
