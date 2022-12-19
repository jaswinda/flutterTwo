import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:week_one_project/pages/home_page.dart';

class LoginController extends GetxController {
  var loading = false.obs;
  Future<void> login({required String email, required String password}) async {
    var data = {'username': email, 'password': password};
    loading.value = true;
    var response = await http
        .post(Uri.parse("http://192.168.1.85/test/signup.php"), body: data);
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"] == true) {
      Get.snackbar("Success", decodedResponse["message"]);
      Get.to(HomePage());
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
    print(response.body);
  }
}
