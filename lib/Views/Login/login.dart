import 'package:flutter/material.dart';
import './formInput.dart';
import './button.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
   
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 10.0;
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
                  FormInput(phoneController, false, "手机号码"),
                  FormInput(passwordController, true, "密码"),
                  SubmitBtn(onClick: login)
            ]),
          )
        ],
      ),
    );
  }
}
