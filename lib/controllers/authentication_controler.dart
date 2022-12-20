import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_one_project/main.dart';
import 'package:week_one_project/pages/home_page.dart';
import 'package:week_one_project/pages/login_page.dart';
import 'package:week_one_project/utils/api.dart';

class AuthenticationController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var loading = false.obs;
  Future<void> login({required String email, required String password}) async {
    var data = {'username': email, 'password': password};
    loading.value = true;
    var response = await http.post(Uri.parse(LOGINAPI), body: data);
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    print(decodedResponse);
    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
      var token = decodedResponse["token"];
      sharedPreferences.setString("token", token);
      Get.to(const HomePage());
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }

  Future<void> register(
      {required String email, required String password}) async {
    var data = {'username': email, 'password': password};
    loading.value = true;
    var response = await http.post(Uri.parse(SIGNUPAPI), body: data);
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
      Get.to(const HomePage());
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }

  checkIfLogin() async {
    var token = await sharedPreferences.getString("token");
    if (token != null) {
      Get.to(HomePage());
    } else {
      Get.to(LoginPage());
    }
  }
}
