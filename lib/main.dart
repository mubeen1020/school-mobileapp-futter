import 'package:flutter/material.dart';
import 'package:al_hamd_school/routes.dart';
import 'package:al_hamd_school/screens/splash/splash_screen.dart';
import 'package:al_hamd_school/theme.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

void main() async {
  print("initiliazing get material");
  await GetStorage.init();
  print(" completed ----------");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    box.write("student_id", -1);
    box.write("_baseUrl", "http://167.71.230.14:8069");
    // box.write("_baseUrl", "http:access_token//192.168.1.103:8069");


    // box.write('Cookie', "session_id=efdb926d428ca57ec39be56af54944b69beb2f8e");
    // box.write('access_token',
    //     "access_token_cc5b998b32ba309d5f3ba3183c929ac9cd6e46e1");
    // box.write("partner_id", "52");

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
