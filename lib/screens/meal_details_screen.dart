import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
    );
  }
}
