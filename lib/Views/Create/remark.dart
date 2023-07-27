import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

class RemarkInput extends StatefulWidget {
  const RemarkInput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RemarkInputState();
}

class RemarkInputState extends State<RemarkInput> {
  //文本编辑控制器
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: '说点什么...'),
            style: TailTypo().font_size(14.0).TextStyle()));
  }
}
