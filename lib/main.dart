import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/bindings.dart';
import 'controller/onlinecontroller.dart';
import 'controller/user_controller.dart';
import 'screen/choose_scr.dart';
import 'screen/home/home_view.dart';

import 'screen/login_scr/login_scr.dart';
import 'screen/menu/menu_view.dart';
import 'screen/splish.dart';

void main()  async{
  await GetStorage.init();


  runApp(  MyApp());
}

class MyApp extends StatelessWidget {


  var box = GetStorage();

  UserController _userController=Get.put(UserController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  var  accessToken=   box.read("access" );


 if(accessToken!=null){
   print(accessToken);
   _userController.updatetoken(accessToken);
 }

    return GetMaterialApp(
        debugShowCheckedModeBanner: false, initialBinding: AllBindings(),

        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: accessToken==null?LogInScr():Home() //Splish()//const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var box = GetStorage();
  var accessToken ;

  @override
  Widget build(BuildContext context) {

    return accessToken==null?    LogInScr():Home();
  }

  @override
  void initState()  {
  //  accessToken=   box.read("accessToken" );
    super.initState();
  }
}
