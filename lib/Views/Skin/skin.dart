import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// app主题
import 'package:note_app/provider/skin_model.dart';
import 'package:note_app/config/skinColors.dart';

class SkinList extends StatefulWidget {
  const SkinList({Key? key,}) : super(key: key);

 @override
  State<StatefulWidget> createState() => _SkinListState();

  void change() {
   
  }
}

class _BottomBarState extends State<BottomBar> {
  
  @override
  initState() {
    super.initState();
  }

  void itemClick(Colors color) {
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('换肤'),
        elevation: 0,
      ),
      body: Consumer(builder: (BuildContext context, AppSkin appSkin, Widget child) {
        return ListView(
          children: listColor.map((item) => Container(
            color: item
          )).toList(),
        )
      }),
    );
  }
}