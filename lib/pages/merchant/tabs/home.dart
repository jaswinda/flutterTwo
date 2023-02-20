import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/card_button.dart';
import 'package:week_one_project/pages/merchant/category_page.dart';
import 'package:week_one_project/pages/merchant/product_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Merchant Home"),
      ),
      body: Wrap(
        children: [
          Cardbutton(
            onTap: () {
              Get.bottomSheet(const CategoryPage());
            },
            lable: "Add Category",
          ),
          Cardbutton(
            onTap: () {
              Get.bottomSheet(const ProductPage());
            },
            lable: "Add Product",
          ),
        ],
      ),
    );
  }
}
