import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/controllers/cart_controller.dart';
import 'package:week_one_project/models/product.dart';
import '../components/app_button.dart';

class IncrementDecrement extends StatelessWidget {
  final Product p;
  final CartController cartController = Get.put(CartController());
  IncrementDecrement({super.key, required this.p});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppButton(
                  onPressed: () => cartController.decrease(),
                  label: "-",
                ),
                Obx(() => Text(
                      cartController.quantity.value.toString(),
                      style: const TextStyle(fontSize: 25),
                    )),
                AppButton(
                  onPressed: () => cartController.increase(),
                  label: "+",
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AppButton(
              label: "Add to Cart",
              width: Get.width,
              onPressed: () => cartController.add(product: p),
            )
          ],
        ),
      ),
    );
  }
}
