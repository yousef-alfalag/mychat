import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_chat_app/core/constant/alert_services.dart';
import 'package:new_chat_app/core/constant/routes.dart';
import 'package:new_chat_app/core/services/my_services.dart';
import 'package:new_chat_app/data/remote/firebase/auth/firebase_auth.dart';
import 'package:new_chat_app/data/remote/firebase/filebase_services.dart';
import 'package:new_chat_app/main.dart';
import 'package:new_chat_app/screens/auth/regester_screen.dart';

abstract class RegesterController extends GetxController {
  regester();
  goToLogin();
  changeImage();
}

class RegesterControllerImp extends RegesterController {
  BuildContext formstate = Get.context!;
  final MyServices myServices = MyServices();
  final FireBaseAuth _auth = FireBaseAuth();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  final FireBaseServices fireBaseServices = FireBaseServices();
  File? imagefile;
  @override
  changeImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagefile = File(file.path);
    }
    update();
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  @override
  regester() async {
    if (imagefile != null) {
      await _auth.signUp(emailCon.text, passwordCon.text);
      String userId = firebaseAuth.currentUser!.uid;
      String? imageURL =
          await fireBaseServices.uploadImage(imagefile!, "Users/$userId");
      await _auth.addUserToFireStore(nameCon.text, imageURL!);
      sharedPreferences.setString("page", "2");
      sharedPreferences.setString("userId", firebaseAuth.currentUser!.uid);
      // alertServices.showtoasr(
      //   title: "Success ,User created",
      //    context: formstate.currentState.context
      // );
      // Get.offNamedUntil(AppRoutes.homeScreen, (route) => false);
      return true;
    } else {
      // alertServices.showtoasr(
      //   title: "failer, Please select an image and fill in the fields.",
      //    context: formstate.currentState!.context
      // );
      return false;
    }
  }
}
