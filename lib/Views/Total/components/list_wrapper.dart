import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailstyle/tailstyle.dart';

// 路由相关
import 'package:note_app/router/application.dart';
// 全局字体配置
import 'package:note_app/config/appIcon.dart';

import 'package:note_app/Views/Component/title_cell.dart';
import 'package:note_app/Views/Home/Widgets/line_space.dart';

// service
import 'package:note_app/service/record_service.dart';
import 'package:note_app/model/record_model.dart';

// 全局配置
import 'package:note_app/config/them.dart';
import 'package:note_app/provider/skin_model.dart';

class ListWrapper extends StatelessWidget {
  const ListWrapper({Key? key, this.dateStr, required this.list})
      : super(key: key);

  final List<Data> list;
  final String? dateStr;

  @override
  Widget build(BuildContext context) {
    List<Widget> arr = [];
    arr.add(LineSpace());
    arr.add(TitleCell(title: "${dateStr} 收支明细"));
    arr.addAll(list.map((item) {
      return CusItem(context, item);
    }).toList());

    return Column(children: arr);
  }
}

// item 组件
Widget CusItem(BuildContext context, item) {
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
                          child:
                              CusIcon(context, appIcons["${item.recordType}"]),
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
Widget CusIcon(BuildContext context, IconData icon) {
  return TailBox()
      .p(10)
      .rounded(30)
      .bg(Provider.of<AppSkin>(context).color)
      .Container(child: Icon(icon, size: 22, color: AppColorConfig.iconColor));
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
