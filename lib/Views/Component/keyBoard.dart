import 'package:flutter/material.dart';

// 全局字体配置
import 'package:note_app/config/appIcon.dart';

class KeyBoard extends StatefulWidget {
  const KeyBoard({Key? key, this.onClick}) : super(key: key);

  final Function? onClick;
  
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

// 数字按钮
List<Widget> digitBtns() {
  List<String> list = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'];
  List<Widget> arr = [];
  list.map((e) {
    Widget wrapper = GestureDetector(
      onTap: () {
      },
      child:Container(
        child:Text(e)
      ),
    )
    arr.add(wrapper)
  })
  arr.add(delBtn())
  return arr;
}

// 删除按钮
Widget delBtn() {
  return Container(child:Icon(
          appIcons["delete"],
          size: 20
        ));
}

// 确定按钮
Widget confirmBtn() {
  return Container(
            width: 80,
            child: Text("确定"),
          );
}
