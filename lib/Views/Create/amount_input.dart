import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

import 'package:note_app/Views/Component/keyBoard.dart';

class AmountInput extends StatefulWidget {
  const AmountInput({super.key});

  @override
  State<StatefulWidget> createState() => AmountInputState();
}

class AmountInputState extends State<AmountInput> {
  String amount = "0.0"; // 最终确认金额
  String tempAmount = "0.0"; // 键盘输入金额

  bool init = true; // 是否第一次点击

  // 数字按钮点击
  void onKeyClick(String value) {
    String newVal = ''; // 新值
    if (init) {
      newVal = value;
      if (value == "." || value == "0") {
        newVal = "0.";
      }
    } else {
      // 已经存在一个小数点
      if (tempAmount.contains(".") && value == ".") {
        newVal = "";
      }
      newVal = tempAmount + "" + newVal;
    }

    // 渲染UI
    setState(() {
      tempAmount = newVal;
    });
    init = false;
  }

  // 确定按钮点击
  void onConfirm() {
    Navigator.of(context).pop();
    setState(() {
      amount = tempAmount;
    });
  }

  // 删除按钮点击
  void onDelete() {
    int len = tempAmount.length; // 字符长度
    String newVal = tempAmount.substring(0, len - 1); // 生成新的字符
    if (newVal.isEmpty) {
      newVal = "0.0";
    }
    // 渲染UI
    setState(() {
      tempAmount = newVal;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                // 自定义点击键盘
                return Column(children: [
                  Container(
                    height: 42,
                    alignment: Alignment.center,
                    child: Text("设置金额", style: TextStyle(fontSize: 42.0)),
                  ),
                  amountContainer(tempAmount),
                  KeyBoard(onKeyClick: onKeyClick,
                    onConfirm: onConfirm,
                    onDelete: onDelete)
                ]);
              });
        },
        child: amountContainer(amount));
  }
}

// 显示金额组件
 Widget amountContainer(String value) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Colors.red, width: 0.5))),
    child: Text(value,
        style: TextStyle(fontSize: 42.0, color: Colors.red)));
 }
