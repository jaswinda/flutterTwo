import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:week_one_project/models/product.dart';
import 'package:week_one_project/services/auth_service.dart';
import 'package:week_one_project/utils/api.dart';
import 'package:week_one_project/utils/messages.dart';

class CartController extends GetxController {
   AuthService authService = AuthService();
  var quantity = 1.obs;
  var cart = {}.obs;
  var totalCosting = 0.0.obs;

  void add({required Product product}) {
    cart[product.id] = jsonEncode(Product(
        description: product.description,
        price: product.price,
        approved: product.approved,
        category: product.category,
        image: product.image,
        quantity: quantity.value.toString()));
    quantity.value = 1;
    totalCosting.value = getTotal();

    Get.back();
    successMessage("Successfully added to Cart");
  }

  void increase() {
    quantity.value++;
  }

  getTotal() {
    var total = 0.0;
    for (var product in cart.values) {
      Product p = Product.fromJson(jsonDecode(product));
      var lineTotal = double.parse(p.price!) * double.parse(p.quantity!);
      total = total + lineTotal;
    }
    return total;
  }

  void decrease() {
    if (quantity.value != 1) {
      quantity.value--;
    }
  }

  onPaymentComplete(  {required String token}) async {
     var token = await authService.getToken();
     var data = {'token': token, 'total': totalCosting.value.toString()};

     print(data);
     var response = await http.post(Uri.parse(PLACE_ORDER), body: data);
      var decodedResponse = await jsonDecode(response.body);
      if (decodedResponse["success"]) {
        cart.clear();
        totalCosting.value = 0.0;
        successMessage("Order Placed Successfully");
      } else {
        print(decodedResponse);
        errorMessage("Failed to place order");
      }
  }
}
