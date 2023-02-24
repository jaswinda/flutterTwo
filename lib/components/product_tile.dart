import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:week_one_project/controllers/product_controller.dart';
import 'package:week_one_project/models/product.dart';

import '../pages/product.dart';
import '../utils/api.dart';

class ProductTile extends StatelessWidget {
  final ProductController? pc;
  final Product p;
  final bool isAdmin;
  final bool isMerchant;
   const ProductTile({super.key, required this.p, this.pc, this.isAdmin = true, this.isMerchant = false });

  @override
  Widget build(BuildContext context) {
    return (isAdmin || p.approved == '1')
        ? InkWell(
            onTap: (() => Get.to(() => AdminProductPage(
                  product: p,
                ))),
            child: Container(
              width: Get.width / 2,
              height: (Get.width / 2) + 50,
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(
                          tag: 'image_${p.image!}',
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
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
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(p.description!),
                              Text("Price: ${p.price}"),
                              if (isAdmin && !isMerchant)
                                ToggleSwitch(
                                  minWidth: 80.0,
                                  cornerRadius: 20.0,
                                  activeBgColors: [
                                    [Colors.green[800]!],
                                    [Colors.red[800]!]
                                  ],
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  initialLabelIndex: p.approved == "1" ? 0 : 1,
                                  totalSwitches: 2,
                                  labels: const ['Approve', 'Reject'],
                                  radiusStyle: true,
                                  onToggle: (index) {
                                    var data = {
                                      'product_id': p.id,
                                      'approved': p.approved == '1' ? '0' : '1'
                                    };
                                    pc!.toggle(data: data);
                                  },
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
