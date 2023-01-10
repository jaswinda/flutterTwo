import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/card_button.dart';
import 'package:week_one_project/pages/merchant/category_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: const Text("Merchant Home"),),

      body: Column(children:  [
        Cardbutton(onTap: (){
          Get.bottomSheet( const CategoryPage());
        }, lable: "Add Category",),
        
        Image.network("https://img.traveltriangle.com/blog/wp-content/uploads/2019/11/cover-for-Things-To-Do-In-Pokhara_28th-nov.jpg", height: 200,width: 200,)
      ],),
    );
  }
}