import 'package:get/get.dart';
import 'package:week_one_project/models/product.dart';

class CartController extends GetxController {
  var cart = {}.obs;

  void add(Product p) {
    cart[p.id] = p;
  }
}
