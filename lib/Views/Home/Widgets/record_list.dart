import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

Map<String, dynamic> config = appConfig();

class RecordList extends StatelessWidget {
  RecordList({Key? key}) : super(key: key);

  List<Map<String, dynamic>> list = [
    {"tag": "日常餐饮", "remark": "食堂吃的烧鸭", "amount": "18", "type": "income"}
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: list.map((item) {
      return CusItem(item);
    }).toList());
  }
}

Widget CusItem(item) {
  return Row(children: [
    Column(children: [
      Title("日常餐饮"),
      Remark("食堂吃的烧鸭"),
    ]),
    Expanded(child: Amount("18"))
  ]);
}

Widget CusIcon(String value) {
  return TailBox()
      .px(8)
      .rounded(30)
      .bg(config["iconBgColor"])
      .Container(child: Icon(Icons.abc, size: 16, color: config["iconColor"]));
}

Widget Title(String text) {
  return TailTypo().font_size(16.0).text_color(Colors.black).Text(text);
}

Widget Remark(String text) {
  return TailTypo().font_size(12.0).text_color(Colors.grey).Text(text);
}

Widget Amount(String text, {String type = 'income'}) {
  return TailTypo()
      .font_size(16.0)
      .text_color(type == 'income' ? config["Income"] : config["expend"])
      .Text(text);
}
