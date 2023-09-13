import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../size_config.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    this.title = "",
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(children: [
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            this.title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(25),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
      // width: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      height: getProportionateScreenHeight(120),
      decoration: new BoxDecoration(
        color: kPrimaryColor,
        gradient: kPrimaryGradientColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
        // borderRadius: BorderRadius.vertical(
        //     bottom:
        //         Radius.elliptical(MediaQuery.of(context).size.width, 100.0)),
      ),
    );
  }
}
