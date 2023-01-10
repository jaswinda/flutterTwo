
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:week_one_project/services/auth_service.dart';
import 'package:week_one_project/utils/api.dart';

class CategoryController extends GetxController {

  AuthService authService = AuthService();
  var isLoading= false.obs;

 
   submit({data, required File image}) async {
    var token = await authService.getToken();
    data["token"] = token;
    isLoading.value = true;
    var request = http.MultipartRequest('POST', Uri.parse(ADD_CATEGORY));
    request.fields.addAll(data);
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    var response = await request.send();
    isLoading.value = false;
    var result = await response.stream.bytesToString();
    var decodedData = jsonDecode(result);
    var success = decodedData['success'];
    var message = decodedData['message'];

    if (success) {
      Get.back();
      Get.snackbar("Success", message,
          colorText: Colors.white, backgroundColor: Colors.green);
    } else {
      Get.snackbar("Error", message,
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
  
}