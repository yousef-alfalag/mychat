import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/core/constant/routes.dart';
import 'package:new_chat_app/core/services/my_services.dart';
import 'package:new_chat_app/data/remote/firebase/auth/firebase_auth.dart';
import 'package:new_chat_app/main.dart';

abstract class LoginController extends GetxController {
  login();
  goToRegester();
}

class LoginControllerImp extends LoginController {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  FireBaseAuth _auth = FireBaseAuth();
  MyServices myServices = MyServices();
  @override
  goToRegester() {
    Get.toNamed(AppRoutes.regesterScreen);
  }

  @override
  login() async {
    try {
      await _auth.login(emailCon.text, passwordCon.text);
      sharedPreferences.setString("page", "2");
      return true;
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }
}
