import 'package:flutter/material.dart';
import "package:flutter_vantui/flutter_vantui.dart";
import '../common/with_value.dart';

import 'package:flutter/widgets.dart';

class SelectDateTime extends StatefulWidget {
  const SelectDateTime({super.key});

  @override
  State<StatefulWidget> createState() {
    return SelectDateTimeState();
  }
}

class SelectDateTimeState extends State<SelectDateTime> {
  var _show = false;

  @override
  void initState() {
    super.initState();
  }

  // 显示弹窗
  show() {
    setState(() => _show = true);
  }

  // 关闭弹窗
  hide() {
    setState(() => _show = false);
  }

  // 确认回调
  confirm(val) {
    hide();
  }

  // 取消回调
  cancel(val) {
    hide();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        child: const Text("点击"),
        onTap: () {
          show();
        },
      ),
      _show
          ? WithModel(
              [DateTime.now().year, DateTime.now().month, DateTime.now().day],
              (model) {
              return Column(children: [
                Text("${model.value}"),
                VanDatePicker(
                  value: model.value,
                  onChange: (value) => model.value = value,
                  onConfirm: (val) => confirm(val),
                  onCancel: (val) => cancel(val),
                ),
              ]);
            })
          : nil
    ]);
  }
}
