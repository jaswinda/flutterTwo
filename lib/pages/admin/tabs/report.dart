
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/card_button.dart';
import 'package:week_one_project/controllers/merchant_controller.dart';
import 'package:week_one_project/models/merchant.dart';

class Report extends StatelessWidget {
  final MerchantController merchantController = Get.put(MerchantController());
   Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: const Text("Merchants"),),
      body: SingleChildScrollView(
        child: Wrap(children: merchantController.merchantsList.map((Merchant merchant) => 
          Cardbutton(onTap: (){},lable: merchant.username,)
        ).toList()
        ,),
      ),
    );
  }
}