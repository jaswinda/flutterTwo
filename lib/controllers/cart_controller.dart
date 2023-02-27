import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:week_one_project/models/product.dart';
import 'package:week_one_project/services/auth_service.dart';
import 'package:week_one_project/utils/api.dart';
import 'package:week_one_project/utils/messages.dart';

class CartController extends GetxController {
   AuthService authService = AuthService();
  var isLoading = false.obs;
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

 Future<void> placeOrder({required String token}) async {
      var token = await authService.getToken();
      var orderItems =  cart.values.map((e) => 
      jsonEncode({
        "product_id": jsonDecode(e)["id"],
        "quantity": jsonDecode(e)["quantity"]
      })
      ).toList();
    var data = {"token": token.toString(),
      "order_items": jsonEncode(orderItems),
      "total": totalCosting.value.toString()
     };
    isLoading.value = true;
    var response = await http.post(Uri.parse(PLACE_ORDER), body: data);
    isLoading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }
}
