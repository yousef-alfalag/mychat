import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/controllers/auth/regester_controller.dart';

class MyAlertServices {
  showtoasr(
      {required String title, IconData? icon, required BuildContext context}) {
    DelightToastBar(
      builder: (context) => ToastCard(
        leading: Icon(
          icon,
          size: 28,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    ).show(context);
  }
}
