import 'package:flutter/material.dart';

// 自定义组件
import 'package:note_app/Views/Total/components/total_card.dart';
import 'package:note_app/Views/Total/components/progress.dart';
import 'package:note_app/Views/Component/title_cell.dart';

class TotalTab extends StatefulWidget {
  const TotalTab({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TotalTabState();
}

class _TotalTabState extends State<TotalTab> {
  List<Map<String, dynamic>> percentages = [
    {
      "text": "餐饮",
      "value": 20,
    },
    {
      "text": "交通",
      "value": 10,
    },
    {
      "text": "娱乐",
      "value": 20,
    },
    {
      "text": "房租",
      "value": 30,
    },
    {
      "text": "超市",
      "value": 10,
    },
    {
      "text": "其他",
      "value": 10,
    },
  ];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      TotalCard(),
      TitleCell(title: "消费分类占比"),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: percentages.map((item) {
            return Container(
              margin: EdgeInsets.all(10),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Text(item["text"])),
                Progress(value: item["value"])
              ]),
            );
          }).toList()),
    ]);
  }
}
