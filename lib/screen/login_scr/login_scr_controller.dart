import 'package:falter/networking/all_network_req.dart';
import 'package:falter/networking/jsonfile/login_json.dart';
import 'package:falter/screen/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
class LogInViewController extends GetxController {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  AllNetworkingReq _allNetworkingReq = AllNetworkingReq();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  RxBool  arlogin = false.obs;
  var box = GetStorage();
  updatarlogin(bool data) {
    arlogin.value = data;

  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) async{
      await  box.write("name", user.user!.displayName);
      await  box.write("email", user.user!.email);
      await  box.write("phone", user.user!.phoneNumber);

      Get.offAll(() => Home());
    });
  }

  // void facebookSignInMethod() async {
  //   final AccessToken result = await FacebookAuth.getInstance().accessToken;
  //
  //   final FacebookAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(result.token);
  //
  //   await _auth.signInWithCredential(facebookAuthCredential).then((user) {
  //     saveUser(user);
  //   });
  // }

  login() async {

    if (!phone.text.isEmpty && !password.text.isEmpty) {

      try {
        updatarlogin(true);
        var data = await _allNetworkingReq
            .logIn(phone: phone.text, password: password.text);
        LoginJson _loginJson=LoginJson.fromJson(data.data);


        await box.write("access", _loginJson.data.accessToken);

        await  box.write("name", _loginJson.data.user.name);
        await  box.write("phone", _loginJson.data.user.phone);
        await  box.write("email", _loginJson.data.user.email);
        await  box.write("id", _loginJson.data.user.id);
        await  box.write("vip", _loginJson.data.user.vip);
        Get.snackbar('مرحبا', "تم تسجيل الدخول بنجاح");
        Get.offAll(() => Home());
      updatarlogin(false);
      } catch (e) {
        print(e);
        Get.snackbar('خطاء', "تاكد من بيانات المستخدم");
        updatarlogin(false);
      }
    } else {
      Get.snackbar('', 'برجاء ادخال البيانات');

      updatarlogin(false);
    }
  }
}
