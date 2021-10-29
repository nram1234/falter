import 'package:falter/screen/mywidget/custmbutton.dart';
import 'package:falter/screen/mywidget/custom_text_filed.dart';
import 'package:falter/utilitie/utilitie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register_scr_controller.dart';

class RegisterScr extends StatefulWidget {
  const RegisterScr({Key? key}) : super(key: key);

  @override
  _RegisterScrState createState() => _RegisterScrState();
}

class _RegisterScrState extends State<RegisterScr> {
  RegisterScrController _controller = RegisterScrController();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _size.height * .1,
            ),
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
              textEditingController: _controller.username,
            ),
            CustomTextFiled(
              hintText: "كلمة المرور",
              keyboardType: TextInputType.text,
              width: _size.width * .8,
              color: Colors.white,
              icon: Icons.lock,
              obscureText: true,
              textEditingController: _controller.password,
            ),
            CustomTextFiled(
              hintText: "تأكيد كلمة المرور",
              keyboardType: TextInputType.text,
              width: _size.width * .8,
              color: Colors.white,
              icon: Icons.lock,
              obscureText: true,
              textEditingController: _controller.repassword,
            ),
            CustomTextFiled(
              hintText: "البريد الالكتروني ",
              keyboardType: TextInputType.emailAddress,
              width: _size.width * .8,
              color: Colors.white,
              icon: Icons.email,
              textEditingController: _controller.email,
            ),
            CustomTextFiled(
              hintText: "رقم الهاتف",
              keyboardType: TextInputType.phone,
              width: _size.width * .8,
              color: Colors.white,
              icon: Icons.phone,
              textEditingController: _controller.phone,
            ),
            CustomTextFiled(
              hintText: "المنطقة",
              keyboardType: TextInputType.text,
              width: _size.width * .8,
              color: Colors.white,
              textEditingController: _controller.area,
            ),
            CustomTextFiled(
              hintText: "المحافطة",
              keyboardType: TextInputType.phone,
              width: _size.width * .8,
              color: Colors.white,
              textEditingController: _controller.city,
            ),
            GetBuilder<RegisterScrController>(builder: (logic) {
              print(logic.regist);
              return logic.regist
                  ? CircularProgressIndicator()
                  : CustomButton(
                      function: () {
                        _controller.register();
                      },
                      width: _size.width * .4,
                      height: 50,
                      btcolor: buttonColor,
                      label: "تسجيل",
                      labcolor: textbuttonColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    );
            }),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 20, bottom: 20),
              child: Divider(
                height: 10,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/face.png',
                  ),
                  Image.asset(
                    'assets/images/googel.png',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
