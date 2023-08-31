import 'package:flutter/material.dart';

class Popup extends PopupRoute {
  ///子组件
  final Widget child;

  ///切换动画时长，必要属性
  final Duration duration;

  ///间隔，用于微调位置
  final EdgeInsets margin;

  ///分布，用于控制大体位置
  final Alignment alignment;

  ///外围遮罩背景色
  Color? outerBackgroudColor;

  ///子控件具体宽度
  double width;

  ///子控件具体高度
  double height;

  ///宽度比例
  double widthFactor;

  ///高度比例
  double heightFactor;

  ///是否点击外围收起弹窗
  bool dismissable;

  Popup(
      {required this.child,
      this.duration = const Duration(milliseconds: 300),
      this.alignment = Alignment.bottomCenter,
      this.margin =
          const EdgeInsets.only(bottom: kBottomNavigationBarHeight * 1.5),
      this.widthFactor = 0.95,
      this.heightFactor = 0.3,
      this.width = 0,
      this.height = 0,
      this.dismissable = true});

  @override
  Color? get barrierColor =>
      outerBackgroudColor ?? Colors.black.withOpacity(0.3);

  @override
  bool get barrierDismissible => dismissable;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => duration;
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Container(
      child: Text("Popup"),
    );
  }
}
