import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';
import 'package:note_app/model/record_model.dart';

// EventBus
import 'package:note_app/event/bus.dart';

// 自定义组件
import 'package:note_app/Views/Component/title_cell.dart';

// 全局配置
import 'package:note_app/config/them.dart';
// 全局字体配置
import 'package:note_app/config/appIcon.dart';

// service
import 'package:note_app/service/record_service.dart';

class RecordList extends StatefulWidget {
  RecordList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  List<Data> list = [];

  getData() {
    RecordService.getList().then((data) => {
      setState(() {
        list = data.data;
      })
    });
  }

  @override
  initState() {
    super.initState();
    // 获取列表数据
    getData()
    Future<void> _listen() async {
      Bus.eventBus.on<UpdateRecordEvent>().listen((event) {
        getData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: ListWrapper(list));
  }
}

List<Widget> ListWrapper(List<Data> list) {
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
            child: CusIcon(appIcons["${item.recordType}"]),
            margin: EdgeInsets.only(right: 10),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Title(item.recordTypeName),
            Container(
              height: 5,
            ),
            Remark(item.remark),
          ])
        ],
      ),
      Container(child: Amount(item.amount.toString(), type: item.type))
    ]),
  );
}

// 显示图标
Widget CusIcon(IconData icon) {
  return TailBox()
      .p(10)
      .rounded(30)
      .bg(AppColorConfig.iconBgColor)
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
