import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

import 'package:note_app/Views/Component/keyBoard.dart';

class AmountInput extends StatefulWidget {
  const AmountInput({Key? key, this.color = Colors.red}) : super(key: key);

  final MaterialColor? color;

  @override
  State<StatefulWidget> createState() => AmountInputState();
}

class AmountInputState extends State<AmountInput> {
  String amount = "0.0"; // 最终确认金额

  bool init = true; // 是否第一次点击

  // 数字按钮点击
  void onKeyClick(String value) {
    String newVal = value;
    if (init) {
      if (value == "." || value == "0") {
        newVal = "0.";
      }
    } else {
      // 已经存在一个小数点
      if (amount.contains(".") && value == ".") {
        newVal = "";
      }
      newVal = amount + "" + newVal;
    }
    setValue(newVal);
    init = false;
  }

  // 设置金额
  void setValue(String value) {
    setState(() => amount = value);
  }

  // 确定按钮点击
  void onConfirm() {
    Navigator.of(context).pop();
  }

  // 删除按钮点击
  void onDelete() {
    int len = amount.length; // 字符长度
    String newVal = amount.substring(0, len - 1); // 生成新的字符
    if (newVal.isEmpty) {
      init = true;
      newVal = "0.0";
    }
    setValue(newVal);
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
                return KeyBoard(
                    onKeyClick: onKeyClick,
                    onConfirm: onConfirm,
                    onDelete: onDelete);
              });
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: widget.color!, width: 0.5))),
            child: Text(amount,
                style: TextStyle(fontSize: 42.0, color: widget.color))));
  }
}
