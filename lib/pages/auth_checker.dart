import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/controllers/authentication_controler.dart';

class AuthChecker extends StatefulWidget {
  AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    await authenticationController.checkIfLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
