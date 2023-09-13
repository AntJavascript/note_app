import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

class RemarkInput extends StatefulWidget {
  const RemarkInput({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RemarkInputState();
}

class RemarkInputState extends State<RemarkInput> {
  //文本编辑控制器
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                hintText: '说说用途吧...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)))),
            style: TailTypo().font_size(14.0).TextStyle()));
  }
}
