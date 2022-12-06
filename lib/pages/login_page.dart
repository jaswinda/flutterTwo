import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/app_button.dart';
import 'package:week_one_project/controllers/login_page_controller.dart';
import 'package:week_one_project/pages/signup.dart';

class LoginPage extends StatelessWidget {
  final loginController = Get.put(LoginController());
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppButton(
                label: "-",
                onPressed: () {
                  loginController.decrement();
                },
              ),
              Obx(() => Center(
                    child: Text(loginController.counter.toString()),
                  )),
              AppButton(
                label: "+",
                onPressed: () {
                  loginController.increment();
                  print(loginController.counter);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          AppButton(
            width: 300,
            label: "Go to Second Page",
            onPressed: () {
              Get.to(SignUp());
            },
          ),
        ],
      ),
    );
  }
}
