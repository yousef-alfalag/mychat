import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/controllers/auth/regester_controller.dart';
import 'package:new_chat_app/core/constant/alert_services.dart';
import 'package:new_chat_app/core/constant/routes.dart';
import 'package:new_chat_app/screens/widgets/custom_button.dart';
import 'package:new_chat_app/screens/widgets/custom_text_form_field.dart';

class RegesterScreen extends StatelessWidget {
  RegesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegesterControllerImp controller = Get.put(RegesterControllerImp());

    MyAlertServices alertServices = MyAlertServices();
    Regester() async {
      bool result = await controller.regester();
      if (result) {
        alertServices.showtoasr(
            title: "Success ,User created", context: context);
        Get.offNamedUntil(AppRoutes.homeScreen, (route) => false);
      } else {
        alertServices.showtoasr(
            title: "failer, Please select an image and fill in the fields.",
            context: context);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Column(
            children: [
              InkWell(
                  onTap: () async {
                    await controller.changeImage();
                  },
                  child: GetBuilder<RegesterControllerImp>(
                    builder: (cont) => CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: MediaQuery.of(context).size.width * 0.15,
                      backgroundImage: controller.imagefile == null
                          ? const AssetImage("assets/images/user.png")
                          : FileImage(controller.imagefile!) as ImageProvider,
                    ),
                  )),
              CustomTextField(
                controller: controller.nameCon,
                hintText: "name",
                obscureText: false,
              ),
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
                    await Regester();
                  },
                  buttonName: "Regester"),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I have account:",
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.goToLogin();
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 15),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
