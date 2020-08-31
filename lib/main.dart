import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App'),
      ),
      body: Center(
        child: Text(
          'Navigation Time!',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
