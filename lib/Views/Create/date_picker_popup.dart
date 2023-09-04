import 'package:flutter/material.dart';

// 日期选择
import 'package:note_app/Views/Home/Widgets/Detail/select_date_time.dart';
import 'package:note_app/Views/Component/Popup.dart';
import "package:flutter_vantui/flutter_vantui.dart";
import 'package:note_app/Views/Component/with_value.dart';

class DatePickerPopup extends StatefulWidget {
  const DatePickerPopup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DatePickerPopupState();
}

class DatePickerPopupState extends State<DatePickerPopup> {
  bool _show = false;

  String values =
      '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';

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

  String get getValue => "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          child: Text(
            values,
            style: TextStyle(fontSize: 16),
          ),
          onTap: () {
            showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return WithModel([
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day
                  ], (model) {
                    return Column(children: [
                      VanDatePicker(
                          value: model.value,
                          onChange: (value) => model.value = value,
                          onConfirm: (val) => null, // confirm(val),
                          onCancel: (val) => null // cancel(val),
                          ),
                    ]);
                  });
                });
          },
        ),
      ],
    );
  }
}
