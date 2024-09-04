import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/controllers/auth/login_controller.dart';
import 'package:new_chat_app/core/constant/alert_services.dart';
import 'package:new_chat_app/core/constant/routes.dart';
import 'package:new_chat_app/screens/widgets/custom_button.dart';
import 'package:new_chat_app/screens/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    MyAlertServices alertServices = MyAlertServices();
    login() async {
      bool result = await controller.login();
      if (result) {
        alertServices.showtoasr(title: "Success ,User Login", context: context);
        Get.offNamedUntil(AppRoutes.homeScreen, (route) => false);
      } else {
        alertServices.showtoasr(
            title: "failer, Username or password is incorrect.",
            context: context);
      }
    }

    return Scaffold(
        body: SafeArea(
      child: Form(
        child: Column(children: [
          CustomTextField(
            controller: controller.emailCon,
            hintText: "email",
            obscureText: false,
          ),
          CustomTextField(
            controller: controller.passwordCon,
            hintText: "password",
            obscureText: true,
          ),
          CustomButton(
              onPressed: () async {
                await login();
              },
              buttonName: "Regester"),
          SizedBox(
            height: 30,
            width: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "create new account?",
              ),
              TextButton(
                  onPressed: () {
                    controller.goToRegester();
                  },
                  child: const Text("Regester Now"))
            ],
          ),
        ]),
      ),
    ));
  }
}
