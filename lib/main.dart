import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti/khalti.dart';
import 'package:week_one_project/controllers/authentication_controler.dart';

import 'package:week_one_project/pages/auth_checker.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Khalti.init(
    publicKey: 'test_public_key_8697f806a5404a599edded181fd4fcf3',
    enabledDebugging: false,
  );
  Get.put(AuthenticationController());
  runApp(const GetMaterialApp(home: AuthChecker()));
}
