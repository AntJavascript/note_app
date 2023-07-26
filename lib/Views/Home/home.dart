import 'package:flutter/material.dart';
import 'Widgets/DateGrid.dart';

class Home extends StatelessWidget {
  final String title;

  const Home(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Application.router.navigateTo(context, "/create");
        },
        child: Text(
          '记一笔',
          style: TextStyle(fontSize: 12.0),
        ),
      ),
      body: const DateGrid(),
    );
  }
}
