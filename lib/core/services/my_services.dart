import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  Future<MyServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
