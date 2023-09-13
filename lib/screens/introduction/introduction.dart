import 'package:flutter/material.dart';

import '../../components/drawer.dart';
import '../../screens/introduction/components/Body.dart';

class Introduction extends StatelessWidget {
  static String routeName = "/introduction";
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        drawer: AppDrawer(),
        body: Body() ,
      ) ;
  }
}
