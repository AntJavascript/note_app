import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'note_app/config/them.dart';

class RecordList extends StatelessWidget {
  const RecordList({
    super.key,
    this.list = [],
  });

  final List<Map<String, dynamic>> list;

  @override
  Widget build(BuildContext context) {
    return Column(children:list.map((item) {
      return Item(item);
    }).toList());
  }
}

Widget Item(item) {
  return Row(
    children:[
      CusIcon(item.icon),
      Column(
        children:[
          Title(item.tag),
          Remark(item.remark),
        ]
      ),
      Expanded(child: Amount(item.amount, {type: item.type}))
    ]
  )
}

Widget CusIcon(String value){
  return TailBox().px(8).rounded(30).bg(AppThem.iconBgColor).Container(
    child:Icon(
      IconData(value, fontFamily: 'Schyler'),
      size: 16, 
      color: AppThem.iconColor
  ));
}

Widget Title(String text) {
  return TailTypo().font_size(16.0).text_color(Colors.black).Text(text);
}

Widget Remark(String text) {
  return TailTypo().font_size(12.0).text_color(Colors.gray).Text(text);
}

Widget Amount(String text, {String type = 'income'}) {
  return TailTypo().font_size(16.0).text_color(type == 'income' ? AppThem["Income"] : AppThem["expend"]).Text(text);
}
