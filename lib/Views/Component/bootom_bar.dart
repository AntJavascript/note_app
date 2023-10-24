import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 全局字体配置
import 'package:note_app/config/appIcon.dart';
// 全局配置
import 'package:note_app/config/them.dart';
import 'package:note_app/provider/skin_model.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  final Function onClick;

  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  @override
  initState() {
    super.initState();
  }

  void itemClick(int index) {
    setState(() => currentIndex = index);
    widget.onClick(index);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildBotomItem(Function onClick, int index, IconData icon,
        String title, int currentIndex) {
      //未选中状态的样式
      TextStyle textStyle = TextStyle(fontSize: 12.0, color: Colors.grey);
      Color iconColor = Colors.grey;
      double iconSize = 20;
      EdgeInsetsGeometry padding = EdgeInsets.only(top: 8.0);

      if (currentIndex == index) {
        //选中状态的文字样式
        textStyle = TextStyle(fontSize: 12.0, color: Colors.white);
        //选中状态的按钮样式
        iconColor = Colors.white;
        padding = EdgeInsets.only(top: 6.0);
      }
      Widget padItem = SizedBox();
      if (icon != null) {
        padItem = Padding(
          padding: padding,
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  ),
                  Text(
                    title,
                    style: textStyle,
                  )
                ],
              ),
            ),
          ),
        );
      }
      Widget item = Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            if (index != currentIndex) {
              onClick(index);
            }
          },
          child: SizedBox(
            height: 52,
            child: padItem,
          ),
        ),
      );
      return item;
    }

    return BottomAppBar(
      color: Provider.of<AppSkin>(context).color, //底部工具栏的颜色。
      shape: CircularNotchedRectangle(),
      notchMargin: 3.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          buildBotomItem(itemClick, 0, appIcons["housing"], "首页", currentIndex),
          buildBotomItem(
              itemClick, 1, appIcons["transfer"], "统计", currentIndex),
          buildBotomItem(itemClick, -1, appIcons["housing"], "", currentIndex),
          buildBotomItem(
              itemClick, 2, appIcons["transfer"], "预算", currentIndex),
          buildBotomItem(itemClick, 3, appIcons["other"], "换肤", currentIndex),
        ],
      ),
    );
  }
}
