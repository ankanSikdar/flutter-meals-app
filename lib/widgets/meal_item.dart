import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem({this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Text(meal.title),
        margin: EdgeInsets.all(20),
      ),
    );
  }
}
