import 'package:flutter/material.dart';
import '../../components/drawer.dart';
import '../../constants.dart';
import '../../size_config.dart';
import './components/body.dart';

class NoticeBoardScreen extends StatelessWidget {
  static String routeName = "/notice_board";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      // appBar: AppBar(
      //   leading: SizedBox(),
      // ),
      body: Body(),
    );
  }
}
