import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/app_button.dart';
import 'package:week_one_project/controllers/login_page_controller.dart';

class SignUp extends StatelessWidget {
  final loginController = Get.find<LoginController>();
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
        ],
      ),
    );
  }
}
