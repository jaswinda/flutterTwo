import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/app_button.dart';
import 'package:week_one_project/controllers/cart_controller.dart';
import 'package:week_one_project/models/product.dart';
import 'package:week_one_project/pages/increment_decrement.dart';
import 'package:week_one_project/utils/api.dart';

class AdminProductPage extends StatelessWidget {
  final Product product;
  final CartController cc = Get.put(CartController());
  AdminProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Hero(
              tag: 'image_${product.image!}',
              child: Image.network(
                baseUrl + product.image!,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
                 const SizedBox(height: 20,),
            Text("Price: ${product.price!}", 
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            
            ),
       
            const SizedBox(height: 20,),
            Text(product.description!),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                width: Get.width,
                onPressed: () {
                  Get.bottomSheet(IncrementDecrement(
                    p: product,
                  ));
                },
                label: "Add To Cart",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
