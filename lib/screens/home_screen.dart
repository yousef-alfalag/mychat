import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_chat_app/controllers/home_controller.dart';
import 'package:new_chat_app/core/constant/routes.dart';
import 'package:new_chat_app/data/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controllerImp = Get.put(HomeControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: StreamBuilder(
            stream: controllerImp.getUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Unable to load data"),
                );
              }
              if (snapshot.hasData && snapshot.data != null) {
                List<UserModel> listUser = [];
                final List mapUsers =
                    (snapshot.data!.docs.map((doc) => doc.data()).toList());
                listUser.addAll(mapUsers.map((e) => UserModel.fromjson(e)));
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    UserModel user = listUser[index];
                    return ListTile(
                      dense: false,
                      onTap: () {
                        Get.toNamed(AppRoutes.chatScreen, arguments: user);
                      },
                      title: Text(user.userName),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.userImage),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
