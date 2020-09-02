import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meal> availabelMeals;

  CategoryMealsScreen({this.availabelMeals});

  @override
  Widget build(BuildContext context) {
    final argumentData =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = argumentData['title'];
    final id = argumentData['id'];

    final categoryMeals =
        availabelMeals.where((meal) => meal.categories.contains(id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
