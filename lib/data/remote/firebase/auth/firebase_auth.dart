import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:new_chat_app/data/models/user_model.dart';

class FireBaseAuth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future signUp(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future login(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future addUserToFireStore(String userName, String userImage) async {
    UserModel newUser = UserModel(
        userId: firebaseAuth.currentUser!.uid,
        userName: userName,
        userImage: userImage);
    await firebaseFirestore
        .collection("Users")
        .doc(newUser.userId)
        .set(newUser.toMap());
  }

  Future<String?> uploadImage(File image) async {
    String userId = firebaseAuth.currentUser!.uid;
    Reference fileRef = firebaseStorage.ref("Chat App/Users/$userId");
    UploadTask task = fileRef.putFile(image);
    return task.then((p0) {
      if (p0.state == TaskState.success) {
        return fileRef.getDownloadURL();
      }
    });
  }
}
