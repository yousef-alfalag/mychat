import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/controllers/chat_controller.dart';
import 'package:new_chat_app/data/models/user_model.dart';
import 'package:new_chat_app/main.dart';
import 'package:new_chat_app/screens/widgets/chat/messages_list.dart';
import 'package:new_chat_app/screens/widgets/chat/writting_message_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChatControllerImp controller = ChatControllerImp();

    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(controller.otherUser!.userImage),
        ),
        title: Text(controller.otherUser!.userName),
      ),
      body: const Column(
        children: [
          // Text(controller.otherUser!.userId),
          // Text(controller.currentUser!)

          Expanded(child: MessagesList()),
          WrittingMessageBar(),
        ],
      ),
    );
  }
}
