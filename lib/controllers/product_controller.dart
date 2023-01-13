import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:week_one_project/models/product.dart';
import 'package:week_one_project/services/auth_service.dart';
import 'package:week_one_project/utils/api.dart';

class ProductController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;
  List<Product> productList = RxList.empty();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    get();
  }

  submit({data, required File image}) async {
    var token = await authService.getToken();
    data["token"] = token;
    isLoading.value = true;
    var request = http.MultipartRequest('POST', Uri.parse(ADD_PRODUCT));
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
      await get();
    } else {
      Get.snackbar("Error", message,
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  Future<void> get() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(PRODUCTGETAPI),
    );
    isLoading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      productList.clear();
      var merchants = await decodedResponse["data"];
      for (var merchant in merchants) {
        productList.add(Product.fromJson(merchant));
      }
      Get.snackbar("Success", decodedResponse["message"],
          backgroundColor: Colors.white);
    } else {
      Get.snackbar("Failed", decodedResponse["message"],
          backgroundColor: Colors.white);
    }
  }
}
