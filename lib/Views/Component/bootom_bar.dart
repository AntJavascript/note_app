import 'package:flutter/material.dart';

// 全局字体配置
import 'package:note_app/config/appIcon.dart';
// 全局配置
import 'package:note_app/config/them.dart';

class BottomBar extends StatefulWidget {
  const BottomBar(
      {Key? key,
      required this.onClick,})
      : super(key: key);

  final Function(String value) onClick;

  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  
  @override
  initState() {
    super.initState();
  }

  void itemClick(int index) {
    widget.onClick(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.black, //底部工具栏的颜色。
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            buildBotomItem(itemClick, 0, Icons.home, "首页"),
            buildBotomItem(itemClick, 1, IconData(0xe901, fontFamily: 'Schyler'), "统计"),
            buildBotomItem(itemClick, -1, null, ""),
            buildBotomItem(itemClick, 2, IconData(0xe908, fontFamily: 'Schyler'), "预算"),
            buildBotomItem(itemClick, 3, Icons.person, "换肤"),
          ],
        ),
      );
  }
}

Widget buildBotomItem(Function onClick, int index, IconData iconData, String title) {
    //未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 12.0, color: Colors.grey);
    Color iconColor = Colors.grey;
    double iconSize = 20;
    EdgeInsetsGeometry padding = EdgeInsets.only(top: 8.0);

    if (selectIndex == index) {
      //选中状态的文字样式
      textStyle = TextStyle(fontSize: 12.0, color: Colors.white);
      //选中状态的按钮样式
      iconColor = Colors.white;
      padding = EdgeInsets.only(top: 6.0);
    }
    Widget padItem = SizedBox();
    if (iconData != null) {
      padItem = Padding(
        padding: padding,
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  iconData,
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
      child: new GestureDetector(
        onTap: () {
          if (index != currentIndex) {
            itemClick(index);
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
