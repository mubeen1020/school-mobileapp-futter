
import 'package:al_hamd_school/constants.dart';
import 'package:al_hamd_school/controllers/TestController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../helper/DioClient.dart';
import '../../models/Messages.dart';
import 'components/body.dart';
import 'components/message.dart';

class MessagesScreen extends StatefulWidget {
  static String routeName = "/messages";

  @override
  State<MessagesScreen> createState() => MessagesScreenState();
}

class MessagesScreenState extends State<MessagesScreen> {
  final DioClient _client = DioClient();
  late  Future<Messages?> chatmessage;


  void updateMessages(){
    setState(() {
      chatmessage =  _client.getMessage();
      Navigator.popAndPushNamed(context,MessagesScreen.routeName);
    });
  }


  @override
  void initState()  {
    // getdata = fetchData() ;
    chatmessage =  _client.getMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: buildAppBar(),
          body:
            FutureBuilder<Messages?>(
                future  :  chatmessage,
                builder: ( context,  snapshot)
                {
                  if(snapshot.hasData)
                    {
                     return Body(snapshot.data);

                    }
                  else{

                    print(snapshot.error);
                    if(snapshot.hasError)
                    {
                      return Center(
                        child: Image(
                          image: AssetImage('assets/images/oops.jpeg'),
                          height: 350,
                        ),
                      );

                    }
                    else
                    {
                      return Center(child: CircularProgressIndicator());
                    }

                  }

                }
            )
        );
      }
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),

          // CircleAvatar(
          //   backgroundImage: AssetImage("assets/images/user_2.png"),
          // ),
          SizedBox(width: kDefaultPadding * 2.75),
          Text(
            "Messages",
            style: TextStyle(fontSize: 20 , color: Colors.black),
          ),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       "Kristin Watson",
          //       style: TextStyle(fontSize: 16),
          //     ),
          //     Text(
          //       "Active 3m ago",
          //       style: TextStyle(fontSize: 12),
          //     )
          //   ],
          // )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.local_phone),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.videocam),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
