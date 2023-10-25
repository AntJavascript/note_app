import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';
import 'package:note_app/model/record_model.dart';

// EventBus
import 'package:note_app/event/bus.dart';

// 路由相关
import 'package:note_app/router/application.dart';

// 自定义组件
import 'package:note_app/Views/Component/title_cell.dart';
import 'package:note_app/Views/Component/loading.dart';
import 'package:note_app/Views/Component/failed.dart';

// 全局配置
import 'package:note_app/config/them.dart';
// 全局字体配置
import 'package:note_app/config/appIcon.dart';

// service
import 'package:note_app/service/record_service.dart';

import 'package:provider/provider.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

class RecordList extends StatefulWidget {
  RecordList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RecordListState();
}

class RecordListState extends State<RecordList> {
  List<Data> list = [];
  bool liading = true;
  bool success = true;

  getData() async {
    setState(() => liading = true);
    final data = await RecordService.getList();
    if (data.code == 200) {
      setState(() {
        list = data.data;
        liading = false;
        success = true;
      });
    } else {
      setState(() {
        list = [];
        success = false;
        liading = false;
      });
    }
    return data;
  }

  @override
  initState() {
    super.initState();
    // 获取列表数据
    getData();
    Bus.eventBus.on<UpdateTotalEvent>().listen((event) {
      getData();
    });
  }

  List<Widget> ListWrapper(List<Data> list) {
    List<Widget> arr = [];
    arr.add(TitleCell(title: "收支明细"));
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
    if (liading) {
      return Loading();
    } else if (!liading && !success) {
      return Failed();
    } else {
      return Column(children: ListWrapper(list));
    }
  }
}
