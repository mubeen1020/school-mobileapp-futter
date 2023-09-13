import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeeBody extends StatelessWidget {
  FeeBody(
      {Key? key,
      this.type = '',
      this.month = '',
      this.status = '',
      this.amount = "0"})
      : super(key: key);
  String? month, status,  type;
  String? amount ;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

        title: Text(type! ,  style: TextStyle(color: Colors.black , fontSize: 20)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(month! , style: TextStyle(color: Colors.black)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(amount.toString() , style: TextStyle(color: Colors.black) ),
            Text(status! , style: TextStyle(color: Colors.black) ),
          ],
        ),
        onTap: () {
          // handle tap
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        horizontalTitleGap: 8.0,
        minVerticalPadding: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        tileColor: Colors.grey,
        selectedTileColor: Colors.grey[200],
        selected: true,
      ),
      // child: ListTile(
      //   title: Text(type!),
      //   leading: Text(month!),
      //   subtitle: Text(status!),
      //   trailing: Text(amount.toString()),
      // ),
    );
  }
}
