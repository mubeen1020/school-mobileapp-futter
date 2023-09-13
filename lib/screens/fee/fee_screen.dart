import 'package:al_hamd_school/controllers/TestController.dart';
import 'package:flutter/material.dart';
import 'package:al_hamd_school/components/drawer.dart';
import 'package:al_hamd_school/screens/fee/components/body.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';



class FeeScreen extends StatelessWidget {
  static String routeName = "/fee";
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
          drawer: AppDrawer(),
          body: Body() ,
         ) ;
  }
}
