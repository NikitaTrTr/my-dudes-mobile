import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/feature/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final TextEditingController _loginEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My\nDudes",
              style: TextStyle(fontFamily: "Rostov", fontSize: 64),
            ),
            Center(
              child: Column(
                children: [
                  TextField(
                    controller: _loginEditingController,
                    decoration: const InputDecoration(label: Text("Логин")),
                    onChanged: (value) {
                      _loginController.login.value = value;
                    },
                  ),
                  TextField(
                    controller: _passwordEditingController,
                    obscureText: true,
                    autocorrect: false,
                    decoration: const InputDecoration(label: Text("Пароль")),
                    onChanged: (value) {
                      _loginController.password.value = value;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton.extended(
                label: const Text(
                  "Создать аккаунт",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                backgroundColor: const Color(0xFF363636),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton.extended(
                label: const Text(
                  "Войти",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.orange,
                onPressed: () {
                  _loginController.loginUser();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
    );
  }
}
