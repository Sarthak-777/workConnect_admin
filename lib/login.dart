import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workconnect_admin/home.dart';
import 'package:workconnect_admin/textInputWidget.dart';
import 'package:workconnect_admin/dividerWidget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextInputWidget(
                    controller: _emailController,
                    myIcon: Icons.email_outlined,
                    myLabelText: "Email Id",
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextInputWidget(
                    controller: _passwordController,
                    myIcon: Icons.lock_outline,
                    isObscure: true,
                    myLabelText: "password",
                  ),
                ),
                InkWell(
                  onTap: () async {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    width: double.infinity,
                    child: const Text(
                      'Forgot Password ? ',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print(_emailController.text);
                      print(_passwordController.text);

                      if (_emailController.text == "admin@gmail.com") {
                        Get.to(() => const HomePage());
                      }
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
