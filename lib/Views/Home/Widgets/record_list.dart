import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 自定义组件
import 'package:note_app/Views/Component/title_cell.dart';
import 'package:note_app/Views/Home/Widgets/line_space.dart';

// 全局配置
import 'package:note_app/config/them.dart';
// 全局字体配置
import 'package:note_app/config/appIcon.dart';

class RecordList extends StatelessWidget {
  RecordList({Key? key}) : super(key: key);

  List<Map<String, dynamic>> list = [
    {
      "tag": "日常餐饮",
      "remark": "食堂吃的烧鸭",
      "amount": "18",
      "type": "income",
      "icon": "car"
    },
    {
      "tag": "日常餐饮",
      "remark": "晚餐麻辣烫",
      "amount": "20.8",
      "type": "income",
      "icon": "card"
    },
    {
      "tag": "稿费",
      "remark": "简书日常作品",
      "amount": "20.8",
      "type": "expend",
      "icon": "education"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: ListWrapper(list));
  }
}

List<Widget> ListWrapper(List<Map<String, dynamic>> list) {
  List<Widget> arr = [];
  arr.add(TitleCell(title: "收支明细"));
  arr.addAll(list.map((item) {
    return CusItem(item);
  }).toList());

  return arr;
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
      Row(
        children: [
          Container(
            child: CusIcon(appIcons[item["icon"]]),
            margin: EdgeInsets.only(right: 10),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Title(item["tag"]),
            Container(
              height: 5,
            ),
            Remark(item["remark"]),
          ])
        ],
      ),
      Container(child: Amount(item["amount"], type: item["type"]))
    ]),
  );
}

Widget CusIcon(IconData icon) {
  return TailBox()
      .p(10)
      .rounded(30)
      .bg(AppColorConfig.iconBgColor)
      .Container(child: Icon(icon, size: 22, color: AppColorConfig.iconColor));
}

Widget Title(String text) {
  return TailTypo()
      .font_size(16.0)
      .text_color(AppColorConfig.titleColor)
      .Text(text);
}

Widget Remark(String text) {
  return TailTypo()
      .font_size(12.0)
      .text_color(AppColorConfig.labelColor)
      .Text(text);
}

Widget Amount(String text, {String type = 'income'}) {
  bool isIncome = type == 'income';
  return TailTypo()
      .font_size(16.0)
      .text_color(isIncome
          ? AppColorConfig.incomeTextColor
          : AppColorConfig.expendTextColor)
      .Text("${isIncome ? "-" : "+"}${text}");
}
