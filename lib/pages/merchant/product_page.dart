import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:week_one_project/components/app_button.dart';
import 'package:week_one_project/controllers/category_controller.dart';
import 'package:week_one_project/controllers/product_controller.dart';
import 'package:week_one_project/utils/messages.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  ProductController productController = Get.put(ProductController());
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Product",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    hintText: "Enter Product Name",
                    labelText: "Product Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: description,
                  decoration: const InputDecoration(
                    hintText: "Enter Product description",
                    labelText: "Product description",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: price,
                  decoration: const InputDecoration(
                    hintText: "Enter Product Price",
                    labelText: "Product Price",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () async {
                    image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: image != null
                        ? Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"),
                  ),
                ),
                Container(
                  child: productController.isLoading.value
                      ? const CircularProgressIndicator()
                      : AppButton(
                          label: "Add",
                          onPressed: () {
                            var isValid = _formKey.currentState!.validate();

                            if (image == null) {
                              errorMessage("File not provided");
                            }
                            if (isValid) {
                              var data = {
                                'name': name.text,
                                'description': description.text,
                                'price': price.text,
                                'category_id': "1"
                              };
                              productController.submit(
                                  data: data, image: File(image!.path));
                            }
                          },
                          width: Get.width,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
