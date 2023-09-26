import 'package:flutter/material.dart';
import 'package:tailstyle/tailstyle.dart';

// 全局配置
import 'package:note_app/config/them.dart';
// 全局字体配置
import 'package:note_app/config/appIcon.dart';

class Tag extends StatefulWidget {
  final String? text;
  final String? icon;
  final bool? isActive;
  final Function? onClick;

  const Tag({
    this.text,
    this.icon,
    super.key,
    this.onClick,
    this.isActive = false,
  });

  @override
  State<StatefulWidget> createState() => TagState();
}

class TagState extends State<Tag> {
  get isActive => widget.isActive == true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 文本颜色
    Color textColor = isActive ? Colors.white : Color.fromARGB(255, 78, 78, 78);
    // 背景颜色
    Color bgColor = isActive
        ? AppColorConfig.iconBgColor
        : Color.fromARGB(255, 230, 229, 229);

    return GestureDetector(
      onTap: () {
        widget.onClick!(widget.icon, widget.text); // 传值父组件
      },
      child: TailBox().px(10).py(6).rounded(30).bg(bgColor).Container(
              child: Row(
            children: [
              CusIcon(appIcons[widget.icon], isActive),
              TailTypo().text_color(textColor).font_size(14).Text(widget.text!)
            ],
          )),
    );
  }
}

Widget CusIcon(IconData icon, bool isActive) {
  return Container(
    margin: EdgeInsets.only(right: 5),
    child: Icon(
      icon,
      size: 20,
      color: isActive ? Colors.white : Colors.black,
    ),
  );
}
