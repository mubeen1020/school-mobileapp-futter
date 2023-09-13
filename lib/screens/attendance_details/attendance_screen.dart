import 'package:al_hamd_school/controllers/TestController.dart';
import 'package:al_hamd_school/models/attendance.dart';
import 'package:flutter/material.dart';
import 'package:al_hamd_school/components/drawer.dart';
import 'package:al_hamd_school/screens/attendance_details/components/body.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../helper/DioClient.dart';

class AttendaceScreen extends StatelessWidget {
  static String routeName = "/attendance";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      // appBar: AppBar(
      //   leading: SizedBox(),
      // ),
      body: GetBuilder<TestController>(
        builder: (controller) => !controller.isLoading
            ? Body(controller)
            : SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven
                    ? Color.fromARGB(255, 67, 54, 244)
                    : Colors.green,
              ),
            );
          },
        ),)
    );
  }
}
