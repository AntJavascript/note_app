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
  
  @override
  void initState() {
    super.initState();
    showModal();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModal();
      },
      child:TailBox().border_b(Colors.red, 0.5).Container(
        child: Text(
            amount,
            style: TextStyle(fontSize: 42.0, color: Color.red)
        )
      )
    );
  }
}

// 显示弹窗键盘
Widget showModal(){
  return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return KeyBoard();
        });
}
