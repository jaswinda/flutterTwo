import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_one_project/components/app_button.dart';
import 'package:week_one_project/controllers/authentication_controler.dart';
import 'package:week_one_project/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginController = Get.put(AuthenticationController());
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/images/logo.png", width: 100, height: 100)
          ,
          const SizedBox(height: 20),
          const Center(
              child: Text(
            "Login",
            style: TextStyle(fontSize: 24, color: Colors.blue),
          )),
          const SizedBox(height: 20),
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              hintText: "Enter your username",
              labelText: "Username",
              border: OutlineInputBorder(),
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
            ),
          ),
          const SizedBox(height: 20),
          Obx(() => Container(
                child: loginController.loading.value
                    ? const CircularProgressIndicator()
                    : AppButton(
                        label: "Login",
                        width: Get.width,
                        onPressed: () {
                          loginController.login(
                              username: usernameController.text,
                              password: passwordController.text);
                        },
                      ),
              )),
          const SizedBox(
            height: 20,
          ),
          const Text("DON'T HAVE ACCOUNT?"),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                Get.to(RegisterPage());
              },
              child: const Text("Sign Up")),
        ]),
      ),
    );
  }
}
