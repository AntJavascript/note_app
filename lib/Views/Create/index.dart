import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 自定义组件
import 'amount_input.dart';
import 'date_picker_popup.dart';
import 'group_tag.dart';
import 'remark.dart';
import 'title_cell.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('记一笔'),
        elevation: 0,
      ),
      body: TailBox().px(16).Container(
              child: Column(children: [
            AmountInput(),
            TitleCell('支出日期：'),
            DatePickerPopup(),
            TitleCell('支出类型：'),
            GroupTag(),
            TitleCell('备注：'),
            RemarkInput()
          ])),
    );
  }
}
