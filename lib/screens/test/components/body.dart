import 'dart:convert';

import 'package:al_hamd_school/components/default_button.dart';
import 'package:al_hamd_school/constants.dart';
import 'package:al_hamd_school/controllers/TestController.dart';
import 'package:al_hamd_school/helper/DioClient.dart';
import 'package:al_hamd_school/screens/home/components/categories.dart';
import 'package:al_hamd_school/size_config.dart';
import 'package:flutter/material.dart';
import 'package:al_hamd_school/components/header.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  TestController controller;
  Body(this.controller);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Header(
              title: "Test Screen",
            ),
            Text(controller.count.toString()),
            DefaultButton(
              text: "Count up",
              press: () {
                controller.increment();
              },
            ),
            DefaultButton(
              text: "Count down",
              press: () {
                controller.decrease();
              },
            ),
            DefaultButton(
              text: "Snack Bar Example",
              press: () {
                Get.snackbar(
                  "Al-Hamd School",
                  "Welcome",
                  icon: Icon(Icons.person, color: Colors.white),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  borderRadius: 20,
                  margin: EdgeInsets.all(15),
                  colorText: Colors.white,
                  duration: Duration(seconds: 4),
                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,
                  forwardAnimationCurve: Curves.easeOutBack,
                );
              },
            ),
            DefaultButton(
              text: "Dialog Example",
              press: () {
                Get.defaultDialog(
                  title: "GeeksforGeeks",
                  middleText: "Hello world!",
                  backgroundColor: Colors.green,
                  titleStyle: TextStyle(color: Colors.white),
                  middleTextStyle: TextStyle(color: Colors.white),
                );
              },
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image.network(controller.user?.data.avatar.toString()),
                SizedBox(height: 8.0),
                Text(
                  '${controller.user?.data.firstName} ${controller.user?.data.lastName}',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  '${controller.user?.data.email}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Text(controller.user?.data.firstName ?? ''),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: DropdownButton(
                style: TextStyle(color: kPrimaryColor),
                iconEnabledColor: kPrimaryColor,
                isExpanded: true,
                // value: selectedValue,
                // icon: Icon(Icons.flag),
                // items: [
                //   DropdownMenuItem(child: Text("Brazil"), value: "Brazil")
                // ],
                items: controller.students
                    ?.map((e) =>
                        DropdownMenuItem(child: Text(e.name), value: e.id))
                    .toList(),
                onChanged: (newValue) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
