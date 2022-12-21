import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/app_button.dart';
import 'package:week_one_project/pages/auth_checker.dart';
import 'package:week_one_project/services/auth_service.dart';

class AdminHome extends StatelessWidget {
    AuthService authService = AuthService();
   AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          AppButton(
            label: "Logout",
            onPressed:() async {
 await authService.removeToken();
                Get.to(const AuthChecker());
          }),
          const Center(child: Text("Admin Home")),
        ],
      ),
    );
  }
}