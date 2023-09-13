import 'dart:convert';

import 'package:al_hamd_school/controllers/TestController.dart';
import 'package:al_hamd_school/screens/introduction/introduction.dart';

import 'package:al_hamd_school/screens/messages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:al_hamd_school/components/header.dart';
import 'package:al_hamd_school/screens/attendance_details/attendance_screen.dart';
import 'package:al_hamd_school/screens/notice_board/notice_board_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constants.dart';
import '../../../models/Student.dart';
import '../../ContactUs/contactus.dart';
import '../../fee/fee_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  TestController? controller;

  Body(this.controller);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final box = GetStorage();
  int selectedValue = -1;


  static const snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Header(
              title: "Dashboard",
            ),
            SizedBox(height: 10),
            // ProfilePic(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text('Select Student:'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              // child: DropdownButton(
              //   style: TextStyle(color: kPrimaryColor),
              //   iconEnabledColor: kPrimaryColor,
              //   isExpanded: true,
              //   value: selectedValue,
              //   // icon: Icon(Icons.flag),
              //   items: dropdownItems,
              //   onChanged: (String? newValue) {
              //     // setState(() {
              //     selectedValue = newValue!;
              //     // });
              //   },
              // ),
              child: DropdownButton(
                style: TextStyle(
                    color: kPrimaryColor, backgroundColor: Colors.white),
                iconEnabledColor: kPrimaryColor,
                isExpanded: true,
                value: box.read("student_id") ,
                // icon: Icon(Icons.flag),
                // items: [
                //   DropdownMenuItem(child: Text("Brazil"), value: "Brazil")
                // ],
                items: widget.controller?.students
                    ?.map(
                      (e) => DropdownMenuItem(
                          child: Center(
                              child: Text(
                            e.name,
                            style: TextStyle(fontSize: 20),
                          )),
                          // value: e.standardId[1].toString()+","+e.id.toString() ),
                    value: e.id),
                    )
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedValue =  newValue as int;
                    box.write("student_id", selectedValue);
                    print("student Id =================" + box.read("student_id").toString());
                    widget.controller?.getattendace();

                  });
                  print(newValue);
                  print(box.read("StandardId"));
                },
              ),
            ),

            SizedBox(height: 20),
            ProfileMenu(
              text: "Notice Board",
              icon: "assets/icons/User Icon.svg",
              press: () => {
                if (box.read("student_id") == -1)
                  {
                    Get.snackbar(
                      "Error",
                      "Please Select Student First",
                      icon: Icon(Icons.error, color: Colors.red),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.white,
                      borderRadius: 20,
                      margin: EdgeInsets.all(15),
                      colorText: Colors.green,
                      duration: Duration(seconds: 4),
                      isDismissible: true,
                      dismissDirection: DismissDirection.horizontal,
                      forwardAnimationCurve: Curves.easeOutBack,
                    ),
                    ////
                  }
                else
                  {Navigator.pushNamed(context, NoticeBoardScreen.routeName)}
              },
            ),
            ProfileMenu(
              text: "Fee History",
              icon: "assets/icons/DOLLAR-010.svg",
              press: () => {
                if (box.read("student_id") == -1)
                  {
                    Get.snackbar(
                      "Error",
                      "Please Select Student First",
                      icon: Icon(Icons.error, color: Colors.red),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.white,
                      borderRadius: 20,
                      margin: EdgeInsets.all(15),
                      colorText: Colors.green,
                      duration: Duration(seconds: 4),
                      isDismissible: true,
                      dismissDirection: DismissDirection.horizontal,
                      forwardAnimationCurve: Curves.easeOutBack,
                    ),
                    ////
                  }
                else
                  {Navigator.pushNamed(
                      context, FeeScreen.routeName)

                  }

              },
            ),
            ProfileMenu(
              text: "Attendance",
              icon: "assets/icons/ATTEN-01.svg",
              press: () =>
                  {
                    if (box.read("student_id") == -1)
                      {
                        Get.snackbar(
                          "Error",
                          "Please Select Student First",
                          icon: Icon(Icons.error, color: Colors.red),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                          borderRadius: 20,
                          margin: EdgeInsets.all(15),
                          colorText: Colors.green,
                          duration: Duration(seconds: 4),
                          isDismissible: true,
                          dismissDirection: DismissDirection.horizontal,
                          forwardAnimationCurve: Curves.easeOutBack,
                        ),
                        ////
                      }
                    else
                      {
                        Navigator.pushNamed(context, AttendaceScreen.routeName)
                      }




                  },
            ),
            ProfileMenu(
              text: "Complain",
              icon: "assets/icons/Question mark.svg",
              press: () =>
                  {
                    if (box.read("student_id") == -1)
                      {
                        Get.snackbar(
                          "Error",
                          "Please Select Student First",
                          icon: Icon(Icons.error, color: Colors.red),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white,
                          borderRadius: 20,
                          margin: EdgeInsets.all(15),
                          colorText: Colors.green,
                          duration: Duration(seconds: 4),
                          isDismissible: true,
                          dismissDirection: DismissDirection.horizontal,
                          forwardAnimationCurve: Curves.easeOutBack,
                        ),
                        ////
                      }
                    else
                      {
                        Navigator.pushNamed(context, MessagesScreen.routeName)
                      }
                    }
            ),
            ProfileMenu(
              text: "Contact Us",
              icon: "assets/icons/Log out.svg",
              press: () {
                if (box.read("student_id") == -1)
                {
                  Get.snackbar(
                    "Error",
                    "Please Select Student First",
                    icon: Icon(Icons.error, color: Colors.red),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.white,
                    borderRadius: 20,
                    margin: EdgeInsets.all(15),
                    colorText: Colors.green,
                    duration: Duration(seconds: 4),
                    isDismissible: true,
                    dismissDirection: DismissDirection.horizontal,
                    forwardAnimationCurve: Curves.easeOutBack,
                  );
                }
                else
                {
                  Navigator.pushNamed(context, ContactUs.routeName);
                }
              },
            ),
            ProfileMenu(
              text: "Introduction",
              icon: "assets/icons/Log out.svg",
              press: () {
                if (box.read("student_id") == -1)
                {
                  Get.snackbar(
                    "Error",
                    "Please Select Student First",
                    icon: Icon(Icons.error, color: Colors.red),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.white,
                    borderRadius: 20,
                    margin: EdgeInsets.all(15),
                    colorText: Colors.green,
                    duration: Duration(seconds: 4),
                    isDismissible: true,
                    dismissDirection: DismissDirection.horizontal,
                    forwardAnimationCurve: Curves.easeOutBack,
                  );
                }
                else
                {
                Navigator.pushNamed(context, Introduction.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
