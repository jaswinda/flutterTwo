import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/app_button.dart';
import 'package:week_one_project/controllers/authentication_controler.dart';
import 'package:week_one_project/pages/home_page.dart';
import 'package:week_one_project/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginController = Get.find<AuthenticationController>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Center(
              child: Text(
            "Login",
            style: TextStyle(fontSize: 24),
          )),
          const SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Enter your email",
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Enter your Password",
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() => Container(
                child: loginController.loading.value
                    ? CircularProgressIndicator()
                    : AppButton(
                        label: "Login",
                        width: Get.width,
                        onPressed: () {
                          loginController.login(
                              email: emailController.text,
                              password: passwordController.text);
                        },
                      ),
              )),
          SizedBox(
            height: 20,
          ),
          Text("DON'T HAVE ACCOUNT?"),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                Get.to(RegisterPage());
              },
              child: Text("Sign Up")),
        ]),
      ),
    );
  }
}
