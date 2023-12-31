import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// app主题
import 'package:note_app/provider/skin_model.dart';
import 'package:note_app/config/skinColors.dart';

class SkinPage extends StatefulWidget {
  const SkinPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SkinPageState();

  void change() {}
}

class _SkinPageState extends State<SkinPage> {
  @override
  initState() {
    super.initState();
  }

  void itemClick(MaterialColor color, AppSkin appSkin) {
    appSkin.setAppSkin(color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('换肤'),
        elevation: 0,
      ),
      body: Consumer(builder: (_, AppSkin appSkin, __) {
        return ListView(
          children: [
            Wrap(
                spacing: 10,
                runSpacing: 16,
                children: listColor.map((item) {
                  return InkWell(
                    child: Container(color: item, width: 70, height: 70),
                    onTap: () {
                      itemClick(item, appSkin);
                    },
                  );
                }).toList())
          ],
        );
      }),
    );
  }
}
