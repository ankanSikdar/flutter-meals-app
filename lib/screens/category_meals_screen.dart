import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final argumentData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = argumentData['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Text('Body'),
    );
  }
}
