import 'package:flutter/material.dart';

// 日期选择
import "package:flutter_vantui/flutter_vantui.dart";
import 'package:note_app/Views/Component/with_value.dart';

// 全局字体配置
import 'package:note_app/config/appIcon.dart';

String year = DateTime.now().year.toString();
String month = DateTime.now().month.toString();
String day = DateTime.now().day.toString();

class DatePickerPopup extends StatefulWidget {
  const DatePickerPopup({Key? key, this.value}) : super(key: key);

  final List<int>? value;

  @override
  State<StatefulWidget> createState() => DatePickerPopupState();
}

class DatePickerPopupState extends State<DatePickerPopup> {
  String values = "${year}-${month.padLeft(2, '0')}-${day.padLeft(2, '0')}";

  List<int> initValue = [
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day
  ];

  @override
  void initState() {
    super.initState();
  }

  // 确认回调
  confirm(val) {
    String year = val[0].toString();
    String month = val[1].toString();
    String day = val[2].toString();
    setState(() {
      values = "${year}-${month.padLeft(2, '0')}-${day.padLeft(2, '0')}";
    });
    Navigator.of(context).pop();
  }

  // 取消回调
  cancel(val) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 310),
                child: WithModel(widget.value ?? initValue, (model) {
                  return Column(children: [
                    VanDatePicker(
                      value: model.value,
                      onChange: (value) => model.value = value,
                      onConfirm: (val) => confirm(val),
                      onCancel: (val) => cancel(val),
                    ),
                  ]);
                }),
              );
            });
      },
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(
          appIcons["iconDate"],
          size: 20,
          color: Colors.grey,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          values,
          style: TextStyle(fontSize: 16),
        ),
      ]),
    );
  }
}
