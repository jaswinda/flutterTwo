import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:week_one_project/pages/user/home_page.dart';
import 'package:week_one_project/services/auth_service.dart';
import 'package:week_one_project/utils/api.dart';

class AuthenticationController extends GetxController {
  final AuthService authService = AuthService();
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
   
    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
      var token = decodedResponse["token"];
      var isAdmin =  decodedResponse["isAdmin"];
      await authService.savetoken(token, isAdmin: isAdmin);
      Get.to(()=> HomePage());
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
      Get.to( ()=>HomePage());
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }

  
}
