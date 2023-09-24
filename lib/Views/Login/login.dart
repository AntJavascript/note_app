import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:common_utils/common_utils.dart';
import 'package:note_app/model/login.dart';

// 路由配置
import 'package:note_app/router/application.dart';

// widget
import './formInput.dart'; // 输入框
import './button.dart'; // 按钮

// service
import 'package:note_app/service/login_service.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // 弹窗提示
  void _showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
    ));
  }

  // 验证登录
  void loginAction(BuildContext context) async {
    String phone = phoneController.text;
    String password = passwordController.text;
    SharedPreferences prefer = await SharedPreferences.getInstance();

    // 验证手机号码
    if (!RegexUtil.isMobileExact(phone)) {
      _showSnackBar(context, "手机号码不合法");
      return;
    }
    // 密码必须6-10位
    if (password.length < 6 || password.length > 10) {
      _showSnackBar(context, "密码必须6-10位");
      return;
    }
    LoginService.login({"phone": phone, "password": password}).then((data) {
      print(data);
    });
  }

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
                  controller: phoneController,
                  isPwd: false,
                  hintText: "手机号码",
                  maxLength: 11),
              FormInput(
                  controller: passwordController, isPwd: true, hintText: "密码"),
              InkWell(
                  onTap: () {
                    loginAction(context);
                  },
                  child: SubmitBtn())
            ]),
          )
        ],
      ),
    );
  }
}
