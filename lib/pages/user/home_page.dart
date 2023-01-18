import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/product_tile.dart';
import 'package:week_one_project/components/user_component.dart';
import 'package:week_one_project/controllers/product_controller.dart';
import 'package:week_one_project/models/product.dart';
import 'package:week_one_project/pages/auth_checker.dart';
import 'package:week_one_project/services/auth_service.dart';

class HomePage extends StatelessWidget {
  ProductController pc = Get.put(ProductController());
  AuthService authService = AuthService();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text("My chats"),
        actions: [
          IconButton(
              onPressed: () async {
                await authService.removeToken();
                Get.to(const AuthChecker());
              },
              icon: Badge(
                  badgeContent: const Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: const Icon(Icons.shopping_bag))),
          IconButton(
              onPressed: () async {
                await authService.removeToken();
                Get.to(const AuthChecker());
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Obx(() => Wrap(
                children: pc.productList
                    .map((Product p) => ProductTile(
                          p: p,
                          pc: pc,
                          isAdmin: false,
                        ))
                    .toList(),
              )),
        ),
      ),
    );
  }
}
