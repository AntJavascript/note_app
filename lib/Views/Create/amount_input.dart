import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

import 'package:note_app/Views/Component/keyBoard.dart';

class AmountInput extends StatefulWidget {
  const AmountInput({super.key, this.color = Colors.red});

  final MaterialColor? color;

  @override
  State<StatefulWidget> createState() => AmountInputState();
}

class AmountInputState extends State<AmountInput> {
  late String amount = "0.0"; // 最终确认金额

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
        child: TailBox().py(20).border_b(widget.color!, 0.5).Container(
            width: MediaQuery.of(context).size.width,
            child: TailTypo()
                .font_size(42)
                .text_color(widget.color)
                .Text(amount)));
  }
}
