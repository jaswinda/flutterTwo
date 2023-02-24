import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/product_tile.dart';
import 'package:week_one_project/controllers/product_controller.dart';
import 'package:week_one_project/models/product.dart';

class Booking extends StatelessWidget {
  ProductController productController = Get.put(ProductController());
  Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Bookings"),
        ),
        body: Container(
          child: Obx(() => Wrap(
                children: productController.productList
                    .map((Product product) => ProductTile(p: product, isMerchant: true,))
                    .toList(),
              )),
        ));

  }
}

