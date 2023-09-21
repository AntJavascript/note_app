import 'package:flutter/material.dart';
import './formInput.dart';
import './button.dart';

class Register extends StatelessWidget {
  Register({super.key});

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FormInput(
                  controller: phoneController, isPwd: false, hintText: "手机号码"),
              FormInput(
                  controller: emailController, isPwd: true, hintText: "邮箱"),
              FormInput(
                  controller: passwordController, isPwd: true, hintText: "密码"),
              SubmitBtn(onClick: register)
            ]),
          )
        ],
      ),
    );
  }
}
