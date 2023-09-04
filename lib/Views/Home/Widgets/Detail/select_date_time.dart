import 'package:flutter/material.dart';
import "package:flutter_vantui/flutter_vantui.dart";
import 'package:note_app/Views/Component/with_value.dart';
import 'package:note_app/Views/Component/Popup.dart';

import 'package:flutter/widgets.dart';

class SelectDateTime extends StatefulWidget {
  final String value;

  const SelectDateTime(this.value);

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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GestureDetector(
        child: Text(widget.value),
        onTap: () {
          show();
        },
      ),
      _show ? Content(_show) : nil
    ]);
  }
}

Widget Content(bool show) {
  return show
      ? WithModel(
          [DateTime.now().year, DateTime.now().month, DateTime.now().day],
          (model) {
          return Column(children: [
            VanDatePicker(
                value: model.value,
                onChange: (value) => model.value = value,
                onConfirm: (val) => null, // confirm(val),
                onCancel: (val) => null // cancel(val),
                ),
          ]);
        })
      : nil;
}
