import 'package:flutter/material.dart';
import 'package:new_chat_app/controllers/chat_controller.dart';
import 'package:new_chat_app/data/models/message_model.dart';

class WrittingMessageBar extends StatelessWidget {
  const WrittingMessageBar({super.key});

  @override
  Widget build(BuildContext context) {
    ChatControllerImp chatController = ChatControllerImp();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: chatController.messageText,
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send_rounded,
            ),
            onPressed: () async {
              await chatController.sendMessage(
                  chatController.messageText.text, MessageType.Text);
              chatController.messageText.clear();
            },
          ),
          IconButton(
              onPressed: () async {
                await chatController.sendfile();
              },
              icon: Icon(Icons.image_outlined))
        ],
      ),
    );
  }
}
