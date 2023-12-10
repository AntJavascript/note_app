import 'package:flutter/material.dart';

import 'package:note_app/Views/Home/Widgets/week.dart';
import 'package:note_app/Views/Home/Widgets/item.dart';

// service
import 'package:note_app/service/record_service.dart';
import 'package:note_app/model/record_model.dart';

import 'package:note_app/Views/Total/components/list_wrapper.dart';

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
    String year = value['year'].toString().padLeft(2, '0');
    String month = value['month'].toString().padLeft(2, '0');
    String day = value['day'].toString().padLeft(2, '0');

    String str = "${year}-${month}-${day}";

    setState(() {
      dateStr = str;
      orgStr = value['str'];
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
              ListWrapper(list: list, dateStr: orgStr)
            ],
          ))
    ]);
  }
}
