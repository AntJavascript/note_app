import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

class AmountInput extends StatefulWidget {
  const AmountInput({super.key});

  @override
  State<StatefulWidget> createState() => AmountInputState();
}

class AmountInputState extends State<AmountInput> {
  @override
  void initState() {
    super.initState();
    _controller.text = '0.0';
  }

  //文本编辑控制器
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TailBox().border_b(Colors.red, 0.5).Container(
        child: TextField(
            controller: _controller,
            cursorWidth: 1,
            cursorColor: Color(0xFFFB923C),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            autofocus: true,
            style: TextStyle(fontSize: 42.0, color: Color(0xFFFB923C))));
  }
}
