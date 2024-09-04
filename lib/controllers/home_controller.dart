import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/data/models/user_model.dart';
import 'package:new_chat_app/main.dart';

abstract class HomeController extends GetxController {
  List<QueryDocumentSnapshot<UserModel>> users = [];
  getUsers();
}

class HomeControllerImp extends HomeController {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String userId = sharedPreferences.getString("userId")!;

  @override
  Stream<QuerySnapshot> getUsers() {
    return _firebaseFirestore
        .collection("Users")
        .where('userId', isNotEqualTo: userId)
        .snapshots();
  }
  // Stream<QuerySnapshot<UserModel>> getUsers() {
  //   return _firebaseFirestore
  //       .collection("Users")
  //       .where("userId", isNotEqualTo: userId)
  //       .snapshots() as Stream<QuerySnapshot<UserModel>>;

  //   // List<UserModel> data = [];
  //   //data.addAll(UserModel.fromjson(querySnapshot.docs));
  // }
}
