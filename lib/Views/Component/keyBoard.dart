import 'package:flutter/material.dart';

// 全局字体配置
import 'package:note_app/config/appIcon.dart';
// 全局配置
import 'package:note_app/config/them.dart';

import 'package:provider/provider.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

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
    double btnWidght = (MediaQuery.of(context).size.width - 80) / 3;
    return Container(
        color: Colors.grey,
        child: Row(children: [
          Expanded(
            child: Wrap(
              children: digitBtns(widget, btnWidght),
            ),
          ),
          confirmBtn(widget, (btnWidght - 40) * 4),
        ]));
  }
}

// 数字按钮
List<Widget> digitBtns(widget, double btnWidght) {
  List<String> list = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.'];
  List<Widget> arr = [];
  list.map((e) {
    Widget wrapper = GestureDetector(
      onTap: () {
        widget.onKeyClick(e);
      },
      child: Container(
          color: Colors.white,
          height: btnWidght - 40,
          width: btnWidght - 0.5,
          margin: EdgeInsets.only(bottom: 0.5, right: 0.5),
          child: Center(
            child: Text(
              e,
              style: TextStyle(fontSize: 24),
            ),
          )),
    );
    arr.add(wrapper);
  }).toList();
  arr.add(delBtn(widget, btnWidght));
  return arr;
}

// 删除按钮
Widget delBtn(widget, double btnWidght) {
  return GestureDetector(
    onTap: () {
      widget.onDelete();
    },
    child: Container(
      color: Colors.white,
      height: btnWidght - 40,
      width: btnWidght - 0.5,
      child: Center(
        child: Text("删除"),
      ),
    ),
  );
}

// 确定按钮
Widget confirmBtn(widget, double heigth) {
  return GestureDetector(
    onTap: () {
      widget.onConfirm();
    },
    child: Container(
      color: Provider.of<AppSkin>(context).color,
      width: 80,
      height: heigth + 3,
      child: Center(
        child: Text("确定", style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
    ),
  );
}
