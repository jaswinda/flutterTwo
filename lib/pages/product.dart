import 'package:flutter/material.dart';
import 'package:week_one_project/models/product.dart';
import 'package:week_one_project/utils/api.dart';

class AdminProductPage extends StatelessWidget {
  final Product product;
  const AdminProductPage({super.key, required this.product});

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
          )
        ],
      ),
    );
  }
}
