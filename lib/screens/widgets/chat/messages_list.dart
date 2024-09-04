import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/controllers/chat_controller.dart';
import 'package:new_chat_app/data/models/message_model.dart';
import 'package:new_chat_app/screens/widgets/chat/message_item.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    ChatControllerImp controllerImp = Get.find();
    return StreamBuilder(
      stream: controllerImp.getMessages(),
      builder: (context, snapshot) {
        List<MessageModel>? listMessages;
        List mapMessages = (snapshot.data!.docs.map((e) => e.data())).toList();
        listMessages!.addAll(mapMessages.map((e) => MessageModel.fromJson(e)));

        return ListView.builder(
          itemCount: listMessages.length,
          itemBuilder: (context, index) {
            return MessageItem(
              message: listMessages[index],
            );
          },
        );
      },
    );
  }
}
