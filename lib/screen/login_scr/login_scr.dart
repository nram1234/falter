import 'package:falter/screen/home/home_view.dart';
import 'package:falter/screen/login_scr/login_scr_controller.dart';
import 'package:falter/screen/mywidget/custmbutton.dart';
import 'package:falter/screen/mywidget/custom_text_filed.dart';
import 'package:falter/screen/register/register_scr.dart';
import 'package:falter/utilitie/utilitie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LogInScr extends StatelessWidget {
  LogInViewController _controller = LogInViewController();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: backgroundColor,
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
              hintText: "التليفون",
              keyboardType: TextInputType.phone,
              width: _size.width * .8,
              color: Colors.white,
              icon: Icons.person,
              textEditingController: _controller.phone,
            ),
            CustomTextFiled(
              hintText: "كلمة المرور",
              keyboardType: TextInputType.text,
              width: _size.width * .8,
              color: Colors.white,
              icon: Icons.lock_open,
              obscureText: true,
              textEditingController: _controller.password,
            ),
Obx((){
 return _controller.arlogin.value? CircularProgressIndicator():CustomButton(function: () {

  _controller.login();

  },
  width: _size.width * .4,
  height: 50,
  btcolor: buttonColor,
  label: "دخول",
  labcolor: textbuttonColor,
  fontWeight: FontWeight.normal,
  fontSize: 14,
  );
})
            // GetBuilder<_controller>(builder: (logic) {
            // print(logic .arlogin);
            //   return logic .arlogin?CircularProgressIndicator():CustomButton(function: () {
            //     logic.updatarlogin(true);
            //    logic.login();
            //     //   Get.to(()=>Home());
            //     // _controller    .;
            //   },
            //     width: _size.width * .4,
            //     height: 50,
            //     btcolor: buttonColor,
            //     label: "دخول",
            //     labcolor: textbuttonColor,
            //     fontWeight: FontWeight.normal,
            //     fontSize: 14,
            //   );
            // }),
         ,   Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 20, bottom: 20),
              child: Divider(
                height: 10,
                color: Colors.grey,
              ),
            ),
            Center(
              child: InkWell(onTap: () {
                Get.to(() => RegisterScr());
              },
                child: Text(
                  "تسجيل حساب جديد",
                  style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
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
                  InkWell(onTap: (){
                    _controller.googleSignInMethod();
                  },
                    child: Image.asset(
                      'assets/images/googel.png',
                    ),
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
