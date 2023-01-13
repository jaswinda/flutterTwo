import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/controllers/product_controller.dart';
import 'package:week_one_project/models/product.dart';
import 'package:week_one_project/utils/api.dart';

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
          child: Obx(() => Column(
                children: productController.productList
                    .map((Product product) => ProductCard(product))
                    .toList(),
              )),
        ));
  }

  Widget ProductCard(Product product) {
    return Container(
        height: 200,
        width: 200,
        color: Color.fromARGB(255, 221, 187, 187),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(baseUrl + product.image!),
              Text(product.category!),
              Text(product.description!),
              Text(product.price!),
              Text(product.approved == '0' ? "Not Approved" : "Approved")
            ],
          ),
        ));
  }
}
