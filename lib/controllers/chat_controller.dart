import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_chat_app/data/models/message_model.dart';
import 'package:new_chat_app/data/models/user_model.dart';
import 'package:new_chat_app/data/remote/firebase/filebase_services.dart';
import 'package:new_chat_app/data/remote/firebase/firebase_messages_services.dart';
import 'package:new_chat_app/main.dart';

abstract class ChatController extends GetxController {
  getMessages();
  sendMessage(String messageContect, MessageType messageType);
  sendfile();
}

class ChatControllerImp extends ChatController {
  final MessagesServices messagesServices = MessagesServices();
  final FireBaseServices fireBaseServices = FireBaseServices();
  String? chatRoomId;
  TextEditingController messageText = TextEditingController();
  late MessageModel message;
  late String fileURL;
  UserModel? otherUser = Get.arguments;
  // String? currentUserId = sharedPreferences.getString("userId");

  String? currentUser = sharedPreferences.getString("userId");
  final CollectionReference collection =
      FirebaseFirestore.instance.collection("Chats");

  @override
  Stream<QuerySnapshot> getMessages() {
    chatRoomId =
        messagesServices.generateChatId(otherUser!.userId, currentUser!);
    return collection
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("dateTime", descending: false)
        .snapshots();
  }

  @override
  Future sendMessage(String messageContect, MessageType messageType) async {
    chatRoomId =
        messagesServices.generateChatId(otherUser!.userId, currentUser!);
    message = MessageModel(
        sender: currentUser!,
        message: messageContect,
        messageType: messageType,
        dateTime: Timestamp.now());
    collection.doc(chatRoomId).collection("messages").add(message.toMap());
  }

  @override
  sendfile() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      chatRoomId =
          messagesServices.generateChatId(otherUser!.userId, currentUser!);
      File file = File(xFile.path);
      String? fileURL =
          await fireBaseServices.uploadImage(file, "Chats/$chatRoomId");
      sendMessage(fileURL!, MessageType.File);
    }
  }
}
