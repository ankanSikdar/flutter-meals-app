import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 28,
            ),
          )),
      home: CategoriesScreen(),
    );
  }
}
