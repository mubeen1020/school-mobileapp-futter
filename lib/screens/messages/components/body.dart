
import 'dart:ffi';

import 'package:al_hamd_school/constants.dart';
import 'package:al_hamd_school/controllers/TestController.dart';
import 'package:al_hamd_school/models/ChatMessage.dart';
import 'package:flutter/material.dart';

import '../../../models/Messages.dart';
import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatefulWidget {
  TestController? controller;
  Messages? chatmessage;

  Body(this.chatmessage);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  ScrollController _scrollController = ScrollController();
  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent+500.0);
    // _scrollController.animateTo(_scrollController.position.maxScrollExtent+1000.0, duration: Duration(milliseconds: 200), curve: Curves.easeOut);
  }

  @override
  void initState() {
    demeChatMessages = [];
    for(var chat in widget.chatmessage!.data )
      {

        String final_body = chat.body.replaceAll('<p>', "");
        final_body  = final_body.replaceAll('</p>', "");

        if(chat.authorId[1] == "Administrator")
          {
            demeChatMessages.add(
                ChatMessage(
                  text: final_body,
                  messageType: ChatMessageType.text,
                  messageStatus: MessageStatus.viewed,
                  isSender: false,
                )
            );

          }
        else
          {

            demeChatMessages.add(
                ChatMessage(
                  text: final_body,
                  messageType: ChatMessageType.text,
                  messageStatus: MessageStatus.viewed,
                  isSender: true,
                )
            );
          }

      }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    return Column(
      children: [

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  Message(message: demeChatMessages[index]),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
