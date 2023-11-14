import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// app主题颜色
import 'package:note_app/provider/skin_model.dart';

class TotalCard extends StatefulWidget {
  const TotalCard({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TotalCardState();

}

// 数据显示
  Widget ShowData(String type, String title, String amount) {
    return Expanded(
        child: Column(
      children: [
        Income(title, type: type),
        LineSpace(
          color: Colors.white,
        ),
        Amount(amount, type: type),
        LineSpace(
          height: 20,
          color: Colors.white,
        ),
      ],
    ));
  }

class _TotalCardState extends State<TotalCard> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Provider.of<AppSkin>(context).color,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TailTypo().font_size(14.0).text_color(Colors.black).Text('总计收支'),
          Row(children: [
            ShowData("expend", "支出", '9852.56'),
            ShowData("income", "收入", '0.0')
          ]),
        ]
      )
    )
  }
}
