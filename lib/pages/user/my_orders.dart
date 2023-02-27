import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/controllers/order_controller.dart';
import 'package:week_one_project/utils/api.dart';

import '../../models/order.dart';

class MyOrders extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());
  MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        backgroundColor: Colors.amber,
      ),
      body: Obx(() => Container(
            child: orderController.isLoading.value
                ? const CircularProgressIndicator()
                : Column(
                    children: orderController.orderList
                        .map((e) =>orderTile(order: e))
                        .toList()),
          )),
    );
  }

  Widget orderTile({required Order order}) {
    return Container(
      decoration: BoxDecoration(
       color: Colors.amber[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Order ID ${order.id}"),
            Text("Total: ${order.total}"),
            Text("Delivered: ${order.isDelivered=='0'?'No':'Yes'}"),
            Text("Ordered At: ${order.orderDate}"),
            Column(
                    children:order.orderItems
                        .map((e) =>productTile( e))
                        .toList()),
            
          ],
        ),
      ),
    );
  }

  Widget productTile(OrderItem orderItem){
    double price = double.parse(orderItem.price);
    double quantity = double.parse(orderItem.quantity);
    double total = price*quantity;
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network('$baseUrl${orderItem.image}',width: 50,height: 50,),
           Text(orderItem.productName),
   
              Text(orderItem.quantity),
                         Text(orderItem.price),
                         Text(total.toString()),
                            



        ],
      ),
    );
  }
}
