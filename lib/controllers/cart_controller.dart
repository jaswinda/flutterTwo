import 'dart:convert';

import 'package:get/get.dart';
import 'package:week_one_project/models/product.dart';
import 'package:week_one_project/utils/messages.dart';

class CartController extends GetxController {
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
}
