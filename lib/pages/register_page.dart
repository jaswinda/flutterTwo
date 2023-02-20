import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/app_button.dart';
import 'package:week_one_project/controllers/authentication_controler.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final registerController = Get.find<AuthenticationController>();
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(children: [
            const SizedBox(height: 80),
            Image.asset("assets/images/logo.png", width: 100, height: 100),
            const Center(
                child: Text(
              "Register",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            )),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Enter Name",
                labelText: "Name",
                border: OutlineInputBorder(),
                icon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: phoneNumber,
              decoration: const InputDecoration(
                hintText: "Enter your phone number",
                labelText: "Username",
                border: OutlineInputBorder(),
                icon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter your username",
                labelText: "Email",
                border: OutlineInputBorder(),
                icon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Enter your password",
                labelText: "Password",
                border: OutlineInputBorder(),
                icon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Enter your password",
                labelText: "Confirm Password",
                border: OutlineInputBorder(),
                icon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => Container(
                  child: registerController.loading.value
                      ? const CircularProgressIndicator()
                      : AppButton(
                          label: "Register",
                          width: Get.width,
                          onPressed: () {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              Get.snackbar("Error", "Password does not match");
                              return;
                            } else {
                              registerController.register(
                                  username: emailController.text,
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneNumber.text
                                  );
                            }
                          },
                        ),
                )),
            const SizedBox(
              height: 20,
            ),
            const Text("ALREADY HAVE ACCOUNT?"),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Text("LOGIN")),
          ]),
        ),
      ),
    );
  }
}
