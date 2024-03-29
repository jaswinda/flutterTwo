import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/card_button.dart';
import 'package:week_one_project/pages/admin/add_merchant.dart';

import '../../merchant/category_page.dart';

class Home extends StatelessWidget {
  
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black, title: const Text("Home"),),
      body: Wrap(
        children:   [
           Cardbutton(
            onTap: () {
              Get.bottomSheet(const CategoryPage());
            },
            lable: "Add Category",
          ),
        Cardbutton(lable: "Add Merchant", onTap: (){
            Get.bottomSheet(
                 AddMerchant()
            );
        
        },),
    
        
        ],
      ),
    );
  }
}