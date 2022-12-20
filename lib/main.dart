import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_one_project/pages/auth_checker.dart';

late SharedPreferences sharedPreferences;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initalizeStorage();
  runApp(GetMaterialApp(home: AuthChecker()));
}

initalizeStorage() async {
  sharedPreferences = await SharedPreferences.getInstance();
}
