import 'package:al_hamd_school/screens/messages/message_screen.dart';
import 'package:al_hamd_school/screens/test/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:al_hamd_school/constants.dart';
import 'package:al_hamd_school/screens/attendance_details/attendance_screen.dart';
import 'package:al_hamd_school/screens/fee/fee_screen.dart';
import 'package:al_hamd_school/screens/home/home_screen.dart';
import 'package:al_hamd_school/screens/notice_board/notice_board_screen.dart';
import 'package:al_hamd_school/size_config.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/dashboard/dashboard_screen.dart';
import '../screens/sign_up/sign_up_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  // const AppDrawer({Key? key}) : super(key: key);
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Ali (IX)"), value: "Ali (IX)"),
      DropdownMenuItem(
          child: Text("Abdul Rehman (II)"), value: "Abdul Rehman (II)"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  String selectedValue = "Abdul Rehman (II)";

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            gradient: kPrimaryGradientColor,
          ),
          child: Center(
            child: Text(
              "AL-Hamd School",
              style: TextStyle(
                fontSize: 25,
                color: kPrimaryLightColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // Center(
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 20, top: 20),
        //     child: Text('Select Student:'),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 20, right: 20),
        //   child: DropdownButton(
        //     style: TextStyle(color: kPrimaryColor),
        //     iconEnabledColor: kPrimaryColor,
        //     isExpanded: true,
        //     value: selectedValue,
        //     // icon: Icon(Icons.flag),
        //     items: dropdownItems,
        //     onChanged: (String? newValue) {
        //       setState(() {
        //       selectedValue = newValue!;
        //       });
        //     },
        //   ),
        // ),
        ListTile(
          leading: Icon(Icons.message, color: kPrimaryColor),
          title: const Text('Dashboard'),
          onTap: () {

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
              Navigator.pushNamed(context, DashboardScreen.routeName);
            }



            },
        ),
        ListTile(
          leading: Icon(Icons.flag, color: kPrimaryColor),
          title: const Text('Notice Board'),
          onTap: () {

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
              Navigator.pushNamed(context, NoticeBoardScreen.routeName);
            }




          },
        ),
        ListTile(
          leading: Icon(Icons.history, color: kPrimaryColor),
          title: const Text('Fee History'),
          onTap: () {
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
              Navigator.pushNamed(context, FeeScreen.routeName);
            }



            },
        ),
        ListTile(
          leading: Icon(Icons.event, color: kPrimaryColor),
          title: const Text('Attendance'),
          onTap: () {

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
              Navigator.pushNamed(context, AttendaceScreen.routeName);

            }



          },
        ),
        ListTile(
          leading: Icon(Icons.message, color: kPrimaryColor),
          title: const Text('Complain'),
          onTap: () {

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
              Navigator.pushNamed(context, MessagesScreen.routeName);
            }


          },
        ),
        // ListTile(
        //   leading: Icon(Icons.event, color: kPrimaryColor),
        //   title: const Text('Test Screen'),
        //   onTap: () {
        //     // Update the state of the app
        //     // ...
        //     // Then close the drawer
        //     Navigator.pushNamed(context, TestScreen.routeName);
        //     // Navigator.pop(context);
        //   },
        // ),
      ],
    ));
  }
}
