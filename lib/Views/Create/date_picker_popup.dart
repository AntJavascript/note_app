import 'package:flutter/material.dart';
import "package:flutter_vantui/flutter_vantui.dart";
import 'package:note_app/Views/Home/Widgets/common/with_value.dart';

class DatePickerPopup extends StatefulWidget {
  final Function? onClick;

  const DatePickerPopup({Key? key, this.onClick}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DatePickerPopupState();
}

class DatePickerPopupState extends State<DatePickerPopup> {
  bool _show = false;
  String values =
      '${DateTime.now().year}, ${DateTime.now().month}, ${DateTime.now().day}';

  @override
  void initState() {
    super.initState();
  }

  // 确认回调
  confirm(val) {
    _show = false;
    setState(() => values = val);
  }

  // 取消回调
  cancel(val) {
    _show = false;
  }

  showPopup() {
    setState(() => _show = true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      VanCell(
        title: "展示弹出层",
        clickable: true,
        onTap: showPopup,
      ),
    ]);
  }
}
