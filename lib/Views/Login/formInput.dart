/**
 * 登录、注册 输入框
  参数：
    @controller 控制器 （必传）
    @isPwd 是否密码输入框
    @hintText 默认提示语
*/ 

import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final TextEditingController? controller;
  final bool? isPwd
  final String? hintText
  
  const FormInput({required this.controller, this.isPwd, this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
