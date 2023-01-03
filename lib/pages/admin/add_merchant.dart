import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/app_button.dart';

class AddMerchant extends StatelessWidget {
    TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
   AddMerchant({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: Get.height/2,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Center(child: Text("Add Merchant",style: TextStyle(fontSize: 20),)),
                         TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: "Enter your anme",
                              labelText: "Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                           AppButton(onPressed: (){}, width: Get.width,)
                    ],
                  ),
                ),
              );
  }
}