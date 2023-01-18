import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/app_button.dart';
import 'package:week_one_project/controllers/cart_controller.dart';
import 'package:week_one_project/models/product.dart';
import 'package:week_one_project/utils/api.dart';

class AdminProductPage extends StatelessWidget {
  final Product product;
  final CartController cc = Get.put(CartController());
  AdminProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: 'image_' + product.image!,
            child: Image.network(
              baseUrl + product.image!,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Text(product.description!),
          Text("Price: " + product.price!),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
              width: Get.width,
              onPressed: () {
                product.quantity = 5;
                cc.add(product);
              },
              label: "Add To Cart",
            ),
          ),
        ],
      ),
    );
  }
}
