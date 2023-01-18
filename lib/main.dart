import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/controllers/authentication_controler.dart';

import 'package:week_one_project/pages/auth_checker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthenticationController());
  runApp(const GetMaterialApp(home: AuthChecker()));
}
