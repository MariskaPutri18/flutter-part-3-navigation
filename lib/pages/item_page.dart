import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(title: const Text("Shopping List")),
      body: Center(
        child: Text(
          '${item.name} with ${item.price}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
