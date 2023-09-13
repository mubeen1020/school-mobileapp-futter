import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../components/drawer.dart';
import '../../controllers/TestController.dart';
import 'components/body.dart';

class TestScreen extends StatelessWidget {
  static String routeName = "/test";
  final TestController controller = Get.put(TestController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                    ))),
    );
  }
}
