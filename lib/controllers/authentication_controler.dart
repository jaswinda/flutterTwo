import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:week_one_project/pages/auth_checker.dart';
import 'package:week_one_project/services/auth_service.dart';
import 'package:week_one_project/utils/api.dart';

class AuthenticationController extends GetxController {
  final AuthService authService = AuthService();

  var loading = false.obs;
  Future<void> login({required String email, required String password}) async {
    var data = {'email': email, 'password': password};
    loading.value = true;
    var response = await http.post(Uri.parse(LOGINAPI), body: data);
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);
   
    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
      var token = decodedResponse["token"];
      var role =  decodedResponse["role"];
      print(decodedResponse);
      await authService.savetoken(token, role: role);

      Get.to(()=> const AuthChecker());
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }

  Future<void> register(
      {required String email, required String password}) async {
    var data = {'email': email, 'password': password};
    loading.value = true;
    var response = await http.post(Uri.parse(SIGNUPAPI), body: data);
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
      print(decodedResponse);
      Get.to( ()=>const AuthChecker());
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }

  
}
