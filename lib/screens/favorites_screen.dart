import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen({this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: favoriteMeals.isEmpty
          ? Center(
              child: Text(
              'No Favorites Added Yet!',
              style: Theme.of(context).textTheme.headline6,
            ))
          : ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(
                  id: favoriteMeals[index].id,
                  title: favoriteMeals[index].title,
                  imageUrl: favoriteMeals[index].imageUrl,
                  duration: favoriteMeals[index].duration,
                  complexity: favoriteMeals[index].complexity,
                  affordability: favoriteMeals[index].affordability,
                );
              },
              itemCount: favoriteMeals.length,
            ),
    );
  }
}
