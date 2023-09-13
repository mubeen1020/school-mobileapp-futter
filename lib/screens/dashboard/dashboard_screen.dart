import 'package:al_hamd_school/controllers/TestController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../components/drawer.dart';
import 'components/body.dart';

class DashboardScreen extends StatelessWidget {
  static String routeName = "/dashboard";
  final TestController controller = Get.put(TestController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
      // onWillPop: () async {
      //   return true;
      // },

      return Scaffold(
        drawer: AppDrawer(),
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
            ),),) ;
    }
}
