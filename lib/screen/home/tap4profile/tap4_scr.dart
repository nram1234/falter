import 'package:falter/screen/home/tap4profile/tap4viewcontroller.dart';
import 'package:falter/screen/mywidget/custmbutton.dart';
import 'package:falter/screen/mywidget/custom_text_filed.dart';
import 'package:falter/utilitie/utilitie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tap4Profile extends GetWidget<Tab4Profile> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/fulllogo.png',
              height: _size.height * .3,
            ),
            CustomTextFiled(
              hintText: "اسم الحساب",
              keyboardType: TextInputType.text,
              width: _size.width * .8,
              color: Colors.white,
              icon: Icons.person,
              textEditingController: controller.name,
            ),
            CustomTextFiled(
              hintText: "البريد الالكتروني ",
              keyboardType: TextInputType.emailAddress,
              width: _size.width * .8,
              color: Colors.white,
              icon: Icons.email,
              textEditingController: controller.email,
            ),
            CustomTextFiled(
              hintText: "رقم الهاتف",
              keyboardType: TextInputType.phone,
              width: _size.width * .8,
              color: Colors.white,
              icon: Icons.phone,
              textEditingController: controller.phone,
            ),
            Obx(() {
              return controller.arupdate.value
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      function: () {
                        controller.updateUserProfile();
                      },
                      width: _size.width * .4,
                      height: 50,
                      btcolor: buttonColor,
                      label: "تعديل",
                      labcolor: textbuttonColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    );
            })
          ],
        ),
      ),
    );
  }
}
