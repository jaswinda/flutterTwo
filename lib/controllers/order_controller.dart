import 'dart:convert';
import 'package:get/get.dart';
import 'package:week_one_project/models/order.dart';
import 'package:week_one_project/utils/api.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {

      var isLoading = false.obs;
      List<Order> orderList = RxList.empty();

      @override
      void onInit() {
        super.onInit();
        get();
      }

    get() async {
      isLoading.value = true;
      var response = await http.get(Uri.parse(GET_ORDERS));
      var decodedResponse = await jsonDecode(response.body);
      if(decodedResponse["success"]){
        orderList = decodedResponse["data"].map<Order>((e) => Order.fromJson(e)).toList();
      }else{
        Get.snackbar("Error", decodedResponse["message"]);
      }
      isLoading.value = false;
    }
}