import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

class RecordList extends StatelessWidget {
  RecordList({Key? key}) : super(key: key);

  List<Map<String, dynamic>> list = [
    {"tag": "日常餐饮", "remark": "食堂吃的烧鸭", "amount": "18", "type": "income"},
    {"tag": "日常餐饮", "remark": "晚餐麻辣烫", "amount": "20.8", "type": "income"},
    {"tag": "稿费", "remark": "简书日常作品", "amount": "20.8", "type": "expend"}
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
  return Container(
    margin: EdgeInsets.all(10.0),
    padding: EdgeInsets.only(bottom: 10.0),
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Color.fromARGB(255, 240, 239, 239), width: 1.0))),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Title(item["tag"]),
        Remark(item["remark"]),
      ]),
      Container(child: Amount(item["amount"], type: item["type"]))
    ]),
  );
}

Widget CusIcon(String value) {
  return TailBox()
      .px(8)
      .rounded(30)
      .bg(AppColorConfig.iconBgColor)
      .Container(child: Icon(Icons.abc, size: 16, color: AppColorConfig.iconColor));
}

Widget Title(String text) {
  return TailTypo().font_size(16.0).text_color(AppColorConfig.titleColor).Text(text);
}

Widget Remark(String text) {
  return TailTypo().font_size(12.0).text_color(AppColorConfig.labelColor).Text(text);
}

Widget Amount(String text, {String type = 'income'}) {
  bool isIncome = type =='income';
  return TailTypo()
      .font_size(16.0)
      .text_color(isIncome' ? AppColorConfig.incomeTextColor : AppColorConfig.expendTextColor)
      .Text("${isIncome ? "-" : "+"}${text}");
}
