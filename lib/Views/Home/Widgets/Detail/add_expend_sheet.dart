import 'package:flutter/material.dart';

// 日期选择
import 'select_date_time.dart';

class AddExpendSheet extends StatelessWidget {
  const AddExpendSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: const Column(children: [Text('记一笔'), SelectDateTime()]));
  }
}
