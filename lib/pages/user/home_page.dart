import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/user_component.dart';
import 'package:week_one_project/pages/auth_checker.dart';
import 'package:week_one_project/services/auth_service.dart';

class HomePage extends StatelessWidget {
  AuthService authService = AuthService();
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text("My chats"),
        actions: [
          IconButton(
              onPressed: () async {
                await authService.removeToken();
                Get.to(const AuthChecker());
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 1; i <= 100; i++)
              UserComponent(
                  image: "https://avatars.githubusercontent.com/u/41540064?v=4",
                  title: "title $i",
                  subtitle: "subtitle",
                  trailing: "trailing,")
          ],
        ),
      ),
    );
  }
}
