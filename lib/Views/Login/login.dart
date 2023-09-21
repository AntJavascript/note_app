import 'package:flutter/material.dart';
import './formInput.dart';
import './button.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
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
                  controller: passwordController, isPwd: true, hintText: "密码"),
              SubmitBtn(onClick: login)
            ]),
          )
        ],
      ),
    );
  }
}
