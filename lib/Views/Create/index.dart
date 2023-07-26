import 'package:flutter/material.dart';

class Create extends StatelessWidget {

  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:'记一笔',
        centerTitle: true,
        elevation: 0,
      ),
      body: const Text('记一笔'),
    );
  }
}

