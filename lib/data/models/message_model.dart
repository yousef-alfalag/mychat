import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String sender;
  String message;
  MessageType messageType;
  Timestamp dateTime;

  MessageModel(
      {required this.sender,
      required this.message,
      required this.messageType,
      required this.dateTime});

  Map toMap() {
    return {
      "sender": sender,
      "message": message,
      "messageType": messageType.name,
      "dateTime": dateTime,
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      sender: json["sender"],
      message: json["message"],
      messageType: json["messageType"],
      dateTime: json["dateTime"],
    );
  }
}

enum MessageType { Text, File }
