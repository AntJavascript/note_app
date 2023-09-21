/**
 * 登录、注册确定按钮
  参数：
    @onClick 点击事件
    @text 按钮文字
*/ 

import 'package:flutter/material.dart';

class SubmitBtn extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onClick
  final String? text
  
  const SubmitBtn({this.onClick, this.text = '确定', super.key});

  @override
  Widget build(BuildContext context) {
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
          text,
          style: TextStyle(
              fontSize: 18.0, color: Colors.white),
        ),
      ),
    ),
  );
  }
}
