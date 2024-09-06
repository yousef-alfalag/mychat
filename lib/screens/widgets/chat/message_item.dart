import 'package:flutter/material.dart';
import 'package:new_chat_app/data/models/message_model.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        color: const Color.fromARGB(255, 120, 75, 197),
        child: message.messageType == MessageType.Text
            ? Text(message.message)
            : Container(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(message.message),
                ),
              ),
      ),
    );
  }
}
