import 'package:flutter/material.dart';

// 日期数据
import 'date.dart';

// 支出、收入显示组件
import 'Detail/Income_or_expenditure.dart';

class Item extends StatelessWidget {
  final Function? onClick;
  const Item({Key? key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 每个item的宽高保持一致
    final double itemHeight = MediaQuery.of(context).size.width / 7;

    return Wrap(
        children: renderData(DateTime.now()).map((e) {
      bool isEmpty = e['day'] == null;
      return GestureDetector(
        onTap: () {
          onClick!(e['str']); // 传值父组件
        },
        child: Container(
          alignment: Alignment.center,
          width: itemHeight - 4,
          margin: EdgeInsets.all(2.0),
          padding: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
              color: isEmpty ? null : Color.fromARGB(255, 246, 238, 247),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Column(
            children: [
              Text(
                isEmpty ? '' : e['day'].toString(),
                style: const TextStyle(fontSize: 14.0),
              ),
              IncomeOrExpenditure(value: isEmpty ? '' : '122.2'),
            ],
          ),
        ),
      );
    }).toList());
  }
}
