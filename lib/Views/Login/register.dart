import 'package:flutter/material.dart';
import './formInput.dart';
import './button.dart';

class Register extends StatelessWidget {
  Register({super.key});

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void register() {
   
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 10.0;
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
                  FormInput(phoneController, false, "手机号码"),
                  FormInput(emailController, true, "邮箱"),
                  FormInput(passwordController, true, "密码"),
                  SubmitBtn(onClick: register)
            ]),
          )
        ],
      ),
    );
  }
}
