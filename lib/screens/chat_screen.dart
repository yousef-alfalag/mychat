import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/controllers/chat_controller.dart';
import 'package:new_chat_app/screens/widgets/chat/writting_message_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ChatControllerImp controller = ChatControllerImp();
    controller.user = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(controller.user.userImage),
        ),
        title: Text(controller.user.userName),
      ),
      body: const Column(
        children: [
          WrittingMessageBar(),
        ],
      ),
    );
  }
}
