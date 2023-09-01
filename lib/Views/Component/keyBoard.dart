import 'package:flutter/material.dart';

class KeyBoard extends StatefulWidget {
  const KeyBoard({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _KeyBoardState();
  
}
class _KeyBoardState extends State<KeyBoard> {
  
  @override
  initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Text("自定义键盘");
  }
  
}
