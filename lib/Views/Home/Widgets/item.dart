import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

// 日期数据函数
import 'date.dart';

// 支出、收入显示组件
import 'Detail/Income_or_expenditure.dart';

class Item extends StatelessWidget {
  final Function? onClick;
  final String dateStr;
  const Item({Key? key, this.onClick, required this.dateStr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("========================${dateStr}");
    // 每个item的宽高保持一致
    final double itemHeight = MediaQuery.of(context).size.width / 7;
    return Wrap(
        children: renderData(DateTime.now()).map((e) {
      bool isEmpty = e['day'] == null;
      bool isActivity = (!isEmpty && dateStr == e['str']);
      return GestureDetector(
        onTap: () {
          onClick!(e['str']); // 传值父组件
        },
        child: Container(
          alignment: Alignment.center,
          width: itemHeight,
          height: 50,
          decoration: BoxDecoration(
            color: isActivity ? AppColorConfig.themColor : Colors.white,
          ),
          child: Center(
              child: TailTypo()
                  .text_color(isActivity ? Colors.white : Colors.black)
                  .font_size(16)
                  .Text(isEmpty ? '' : e['day'].toString())),
        ),
      );
    }).toList());
  }
}
