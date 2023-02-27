import 'dart:convert';
import 'package:get/get.dart';
import 'package:week_one_project/models/order.dart';
import 'package:week_one_project/services/auth_service.dart';
import 'package:week_one_project/utils/api.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
      AuthService authService = AuthService();
      var isLoading = false.obs;
      List<Order> orderList = RxList.empty();

      @override
      void onInit() {
        super.onInit();
        get();
      }

    get() async {
      isLoading.value = true;
      var token = await authService.getToken();
      var data = {"token": token.toString()};
      var response = await http.post(Uri.parse(GET_ORDERS), body: data);
      var decodedResponse = await jsonDecode(response.body);
      if(decodedResponse["success"]){
        orderList = decodedResponse["data"].map<Order>((e) => Order.fromJson(e)).toList();
      }else{
        Get.snackbar("Error", decodedResponse["message"]);
      }
      isLoading.value = false;
    }
}