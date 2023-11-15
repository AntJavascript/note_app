import 'package:flutter/material.dart';

import 'package:note_app/Views/Home/Widgets/week.dart';
import 'package:note_app/Views/Home/Widgets/item.dart';

class TotalDayTab extends StatefulWidget {
  const TotalDayTab({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TotalDayTabState();
}

class _TotalDayTabState extends State<TotalDayTab> {

  String dateStr = "";
  
  @override
  initState() {
    super.initState();
  }

  void onClick(String value) {
    setState(() {
      dateStr = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return return ListView(
      children: [
        Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Week(),
                Item(onClick: onClick),
              ],
            ))
        ]
        );
  }
}
