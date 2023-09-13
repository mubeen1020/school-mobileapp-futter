
import 'package:flutter/material.dart';

import '../../components/drawer.dart';
import 'package:al_hamd_school/screens/ContactUs/components/body.dart';

class ContactUs extends StatelessWidget {
  static String routeName = "/contactus";
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        drawer: AppDrawer(),
        body: Body() ,
      ) ;
  }
}
