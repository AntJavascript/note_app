import 'package:flutter/material.dart';

// 全局字体配置
import 'package:note_app/config/appIcon.dart';

class KeyBoard extends StatefulWidget {
  const KeyBoard(
      {Key? key,
      required this.onKeyClick,
      required this.onConfirm,
      required this.onDelete})
      : super(key: key);

  final Function(String value) onKeyClick;
  final Function onConfirm;
  final Function onDelete;

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
    return Container(
        child: Row(children: [
      ...digitBtns(widget),
      confirmBtn(widget),
    ]));
  }
}

// 数字按钮
List<Widget> digitBtns(widget) {
  List<String> list = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'];
  List<Widget> arr = [];
  list.map((e) {
    Widget wrapper = GestureDetector(
      onTap: () {
        widget.onKeyClick(e);
      },
      child: Container(child: Text(e)),
    );
    arr.add(wrapper);
  }).toList();
  arr.add(delBtn(widget));
  return arr;
}

// 删除按钮
Widget delBtn(widget) {
  return GestureDetector(
    onTap: () {
      widget.onDelete();
    },
    child: Container(child: Icon(appIcons["delete"], size: 20)),
  );
}

// 确定按钮
Widget confirmBtn(widget) {
  return GestureDetector(
    onTap: () {
      widget.onConfirm();
    },
    child: Container(
      width: 80,
      child: Text("确定"),
    ),
  );
}
