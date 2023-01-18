import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:week_one_project/components/product_tile.dart';
import 'package:week_one_project/controllers/product_controller.dart';
import 'package:week_one_project/models/product.dart';
import 'package:week_one_project/pages/merchant/product_page.dart';
import 'package:week_one_project/pages/product.dart';
import 'package:week_one_project/utils/api.dart';

class Products extends StatelessWidget {
  ProductController pc = Get.put(ProductController());
  Products({super.key});

  @override
  Widget build(BuildContext context) {
    pc.get();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Products"),
      ),
      body: Container(
        child: Obx(() => Wrap(
            children: pc.productList
                .map((Product p) => ProductTile(p: p, pc: pc))
                .toList())),
      ),
    );
  }
}
