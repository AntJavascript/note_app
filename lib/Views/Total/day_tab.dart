import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';
import 'package:provider/provider.dart';

import 'package:note_app/Views/Home/Widgets/week.dart';
import 'package:note_app/Views/Home/Widgets/item.dart';

// service
import 'package:note_app/service/record_service.dart';
import 'package:note_app/model/record_model.dart';

import 'package:note_app/Views/Component/title_cell.dart';
import 'package:note_app/Views/Home/Widgets/line_space.dart';

// 全局配置
import 'package:note_app/config/them.dart';
// 全局字体配置
import 'package:note_app/config/appIcon.dart';
// 路由相关
import 'package:note_app/router/application.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

class TotalDayTab extends StatefulWidget {
  const TotalDayTab({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TotalDayTabState();
}

class _TotalDayTabState extends State<TotalDayTab> {
  String dateStr = "";
  String orgStr = ""; // 原始数据
  List<Data> list = [];

  @override
  initState() {
    super.initState();
  }

  void onClick(Map<String, dynamic> value) {
    print(value);
    String year = value['year'].toString().padLeft(2, '0');
    String month = value['month'].toString().padLeft(2, '0');
    String day = value['day'].toString().padLeft(2, '0');

    String str = "${year}-${month}-${day}";

    setState(() {
      dateStr = str;
      orgStr = value['str']
    });
    getData(str);
  }

  getData(String date) async {
    final data = await RecordService.getList(date);
    if (data.code == 200) {
      setState(() {
        list = data.data;
      });
    } else {
      setState(() {
        list = [];
      });
    }
    return data;
  }

  List<Widget> ListWrapper(List<Data> list) {
    List<Widget> arr = [];
    arr.add(LineSpace());
    arr.add(TitleCell(title: "${dateStr} 收支明细"));
    arr.addAll(list.map((item) {
      return CusItem(item);
    }).toList());
    return arr;
  }

  // item 组件
  Widget CusItem(item) {
    return InkWell(
        onTap: () {
          Application.router
              .navigateTo(context, "/detail?id=${item.id}&type=${item.type}");
        },
        child: TailBox()
            .m(10)
            .pb(10)
            .border_b(Color.fromARGB(255, 240, 239, 239), 1)
            .Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Row(
                    children: [
                      TailBox().mr(10).Container(
                            child: CusIcon(appIcons["${item.recordType}"]),
                          ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Title(item.recordTypeName),
                            Container(
                              height: 5,
                            ),
                            Remark(item.remark),
                          ])
                    ],
                  ),
                  Container(
                      child: Amount(item.amount.toString(), type: item.type))
                ])));
  }

  // 显示图标
  Widget CusIcon(IconData icon) {
    return TailBox()
        .p(10)
        .rounded(30)
        .bg(Provider.of<AppSkin>(context).color)
        .Container(
            child: Icon(icon, size: 22, color: AppColorConfig.iconColor));
  }

  // 显示类型
  Widget Title(String text) {
    return TailTypo()
        .font_size(16.0)
        .text_color(AppColorConfig.titleColor)
        .Text(text);
  }

  // 显示备注
  Widget Remark(String text) {
    return TailTypo()
        .font_size(12.0)
        .text_color(AppColorConfig.labelColor)
        .Text(text);
  }

  // 显示金额
  Widget Amount(String text, {String type = 'income'}) {
    bool isIncome = type == 'income';
    return TailTypo()
        .font_size(16.0)
        .text_color(isIncome
            ? AppColorConfig.expendTextColor
            : AppColorConfig.incomeTextColor)
        .Text("${isIncome ? "+" : "-"}${text}");
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          color: Colors.white,
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Week(),
              Item(onClick: onClick, dateStr: orgStr),
              Column(children: ListWrapper(list))
            ],
          ))
    ]);
  }
}
