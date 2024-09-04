import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/core/constant/routes.dart';
import 'package:new_chat_app/core/services/my_services.dart';
import 'package:new_chat_app/main.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int get priorty => 1;

  MyServices services = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences.getString("page") == "2") {
      return const RouteSettings(name: AppRoutes.homeScreen);
    }
    if (sharedPreferences.getString("page") == "1") {
      return const RouteSettings(name: AppRoutes.loginScreen);
    }
    return null;
  }
}
