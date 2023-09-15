import 'package:flutter/material.dart';

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
                  LoginBtn(() {
                    login()
                  })
            ]),
          )
        ],
      ),
    );
  }
}

// 输入框
Widget FormInput(TextEditingController controller, bool isPwd, String hintText) {
  return TextField(
    controller: controller,
    obscureText: isPwd
    decoration: InputDecoration(
      hintText: hintText,
      border: UnderlineInputBorder(
        borderSide: BorderSide(
        width: 1, color: Colors.grey[300])),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Theme.of(context)
            .primaryColor))),
  )
}

// 登录按钮
Widget LoginBtn(Function onClick) {
  return Material(
    child: InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(5.0)),
          color: Theme.of(context).primaryColor,
        ),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 40,
        height: 42.0,
        child: Text(
          '登录',
          style: TextStyle(
              fontSize: 18.0, color: Colors.white),
        ),
      ),
    ),
  )
}
