import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/app_button.dart';
import 'package:week_one_project/controllers/cart_controller.dart';
import 'package:week_one_project/models/product.dart';

import '../utils/api.dart';

class CartPage extends StatelessWidget {
  CartController cartController = Get.put(CartController());
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Wrap(
                children: cartController.cart.values
                    .map((e) => cartTile(
                          p: Product.fromJson(jsonDecode(e)),
                        ))
                    .toList()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => AppButton(
                  onPressed: () {
                    // Get.to(() => KhaltiExampleApp());
                    cartController.placeOrder(token: "token");
                  },
                  width: Get.width,
                  label: "Pay ${cartController.totalCosting}",
                )),
          )
        ],
      ),
    );
  }

  Widget cartTile({required Product p}) {
    return Container(
        width: Get.width,
        height: (Get.width / 3),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.black, width: 0.5),
              boxShadow: const [BoxShadow()],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'image_${p.image!}',
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                baseUrl + p.image!,
                              )),
                          boxShadow: const [BoxShadow()]),
                    ),
                  ),
                ),
                Expanded(
                    child:
                        Text(p.description!, style: const TextStyle(fontSize: 15))),
                Expanded(
                    child: Text(p.quantity.toString(),
                        style: const TextStyle(fontSize: 20))),
                Expanded(
                  child: Text(
                    (int.parse(p.quantity.toString()) *
                            double.parse(p.price.toString()))
                        .toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
