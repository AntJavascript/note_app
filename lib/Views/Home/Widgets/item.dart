import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

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
    // 每个item的宽高保持一致
    final double itemHeight = MediaQuery.of(context).size.width / 7;
    print("========================${dateStr}");
    return Wrap(
        children: renderData(DateTime.now()).map((e) {
      bool isEmpty = e['day'] == null;
      return GestureDetector(
        onTap: () {
          onClick!(e['str']); // 传值父组件
        },
        child: Container(
          alignment: Alignment.center,
          width: itemHeight - 2,
          height: itemHeight - 2,
          margin: EdgeInsets.all(1.0),
          padding: EdgeInsets.all(6.0),
          child: Column(
            children: [
              TailTypo()
                .text_color(dateStr == e['str'] ? Colors.blue : Colors.black)
                .font_size(14)
                .Text(isEmpty ? '' : e['day'].toString()),
              IncomeOrExpenditure(value: isEmpty ? '' : '122.2'),
            ],
          ),
        ),
      );
    }).toList());
  }
}
