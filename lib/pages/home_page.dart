import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/user_component.dart';
import 'package:week_one_project/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text("My chats"),
        actions: [
          IconButton(
              onPressed: () {
                Get.off(LoginPage());
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 1; i <= 100; i++)
              UserComponent(
                  image: "https://avatars.githubusercontent.com/u/41540064?v=4",
                  title: "title " + i.toString(),
                  subtitle: "subtitle",
                  trailing: "trailing,")
          ],
        ),
      ),
    );
  }
}
