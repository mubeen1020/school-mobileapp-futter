import 'dart:convert';

import 'package:al_hamd_school/helper/DioClient.dart';
import 'package:al_hamd_school/models/Messages.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../../../constants.dart';
import '../message_screen.dart';

class ChatInputField extends StatefulWidget {

  ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final myController = TextEditingController();
  final DioClient _client = DioClient();




    @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Icon(Icons.mic, color: kPrimaryColor),
            // SizedBox(width: kDefaultPadding),
            Expanded(
              child: Container(
                // padding: EdgeInsets.symmetric(
                //   horizontal: kDefaultPadding * 0.75,
                // ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [

                    SizedBox(width: kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        controller: myController,
                        decoration: InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    SizedBox(width: kDefaultPadding / 4),
                    IconButton(
                        onPressed: (){
                          _client.SendMessage(myController.text).then((value) {

                            if(value)
                              {
                                MessagesScreenState? state = context.findAncestorStateOfType<MessagesScreenState>();
                                state?.updateMessages();
                              }

                          });

                          print(myController.text);
                        },
                        icon: const Icon(Icons.send)),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
