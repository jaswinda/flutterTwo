
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorMessage(String message){
  Get.snackbar("Error", message, backgroundColor: const Color.fromARGB(255, 238, 199, 199));
}