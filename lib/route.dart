import 'package:get/get.dart';
import 'package:new_chat_app/core/constant/routes.dart';
import 'package:new_chat_app/core/middleware/mymiddleware.dart';
import 'package:new_chat_app/screens/auth/login_screen.dart';
import 'package:new_chat_app/screens/auth/regester_screen.dart';
import 'package:new_chat_app/screens/chat_screen.dart';
import 'package:new_chat_app/screens/home_screen.dart';

List<GetPage> route = [
  GetPage(
      name: "/", page: () => RegesterScreen(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoutes.loginScreen, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.chatScreen, page: () => const ChatScreen()),
];
