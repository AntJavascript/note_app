class Popup extends PopupRoute {

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
    
      }
}
