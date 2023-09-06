import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

import 'package:note_app/Views/Component/keyBoard.dart';

class AmountInput extends StatefulWidget {
  const AmountInput({super.key});

  @override
  State<StatefulWidget> createState() => AmountInputState();
}

class AmountInputState extends State<AmountInput> {
  String amount = "";

  get getValue => amount;

  // 数字按钮点击
  void onKeyClick(String value) {
    setState(() {
      amount += value;
    });
  }

  // 确定按钮点击
  void onConfirm() {}

  // 删除按钮点击
  void onDelete() {}

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
                return KeyBoard(
                    onKeyClick: onKeyClick,
                    onConfirm: onConfirm,
                    onDelete: onDelete);
              });
        },
        child: TailBox().border_b(Colors.red, 0.5).Container(
            child: Text(amount,
                style: TextStyle(fontSize: 42.0, color: Colors.red))));
  }
}
