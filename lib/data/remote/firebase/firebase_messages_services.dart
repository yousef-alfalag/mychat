import 'package:path/path.dart';

class MessagesServices {
  String generateChatId(String userId1, String userId2) {
    List users = [userId1, userId2];
    users.sort();

    String chatRoomId = users.join("_");
    return chatRoomId;
  }
}
