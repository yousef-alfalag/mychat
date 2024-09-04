import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/data/models/message_model.dart';
import 'package:new_chat_app/data/models/user_model.dart';
import 'package:new_chat_app/data/remote/firebase/firebase_messages_services.dart';
import 'package:new_chat_app/main.dart';

abstract class ChatController extends GetxController {
  getMessages();
}

class ChatControllerImp extends ChatController {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection("Chats");
  final MessagesServices messagesServices = MessagesServices();
  String? chatRoomId;

  late UserModel user;
  String? currentUser = sharedPreferences.getString("userId");

  @override
  Stream<QuerySnapshot> getMessages() {
    chatRoomId = messagesServices.generateChatId(user.userId, currentUser!);
    return collection.doc(chatRoomId).collection("messages").snapshots();
  }
}
