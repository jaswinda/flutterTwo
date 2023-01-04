import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/app_button.dart';
import 'package:week_one_project/pages/auth_checker.dart';
import 'package:week_one_project/services/auth_service.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Column(
        children:  [
          const Center(child: Icon(Icons.person, size: 200,)),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Name:"),
              ],
            ),
          ),

           AppButton(label: "Logout",onPressed: (){
            AuthService authService = AuthService();
            authService.removeToken();
            Get.to(const AuthChecker());
          },)

        ],
      ),
    );
  }
}