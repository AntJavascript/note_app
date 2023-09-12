import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

import 'package:note_app/Views/Component/keyBoard.dart';

class AmountInput extends StatefulWidget {
  const AmountInput({super.key});

  @override
  State<StatefulWidget> createState() => AmountInputState();
}

class AmountInputState extends State<AmountInput> {
  String amount = "0.0";

  get getValue => amount;

  // 数字按钮点击
  void onKeyClick(String value) {
    print(value);
    setState(() {
      amount = amount + "" + value;
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
        child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.red, width: 0.5))),
            child: Text(amount,
                style: TextStyle(fontSize: 42.0, color: Colors.red))));
  }
}
