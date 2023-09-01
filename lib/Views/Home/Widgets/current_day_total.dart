import 'package:flutter/material.dart';

// 自定义组件
import 'package:note_app/Views/Component/title_cell.dart';

class CurrentDayTotal extends StatefulWidget {
  const CurrentDayTotal({Key? key, required this.dateStr}) : super(key: key);
  
  final String? dateStr;
  
  @override
  State<StatefulWidget> createState() => _CurrentDayTotalState();
}

class _CurrentDayTotalState extends State<CurrentDayTotal> {
  
  @override
  initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [TitleCell("收支统计")]
    );
  }
  
}
