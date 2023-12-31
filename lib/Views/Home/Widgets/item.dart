import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';

// service
import 'package:note_app/service/total_service.dart';

// 日期数据函数
import 'date.dart';

// 支出、收入显示组件
import 'Detail/Income_or_expenditure.dart';

class Item extends StatefulWidget {
  const Item({Key? key, this.onClick, this.dateStr}) : super(key: key);

  final Function? onClick;
  final String? dateStr;

  @override
  State<StatefulWidget> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  List<Map<String, dynamic>> list = [];
  int year = DateTime.now().year;
  int month = DateTime.now().month;

  getData() async {
    final data = await TotalService.totalMonthDetail(year, month);
    if (data.code == 200) {
      setState(() {
        list = data.data;
      });
    } else {
      setState(() {
        list = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 每个item的宽高保持一致
    final double itemHeight = MediaQuery.of(context).size.width / 7 - 1;
    return Wrap(
        children: renderData(DateTime.now()).map((e) {
      bool isEmpty = e['day'] == null;
      bool isActivity = (!isEmpty && widget.dateStr == e['str']);
      return GestureDetector(
        onTap: () {
          widget.onClick!(e); // 传值父组件
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
