import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalPage extends StatefulWidget {
  const TotalPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TotalPageState();

  void change() {}
}

class _TotalPageState extends State<TotalPage> {
  @override
  initState() {
    super.initState();
  }

  void itemClick(Colors color) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('统计'),
        elevation: 0,
      ),
      body: Center(),
    );
  }
}
