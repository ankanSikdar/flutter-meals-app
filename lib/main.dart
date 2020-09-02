import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _avialableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> currentFilters) {
    setState(() {
      _filters = currentFilters;

      _avialableMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters['gluten']) {
          return false;
        }
        if (!meal.isLactoseFree && _filters['lactose']) {
          return false;
        }
        if (!meal.isVegan && _filters['vegan']) {
          return false;
        }
        if (!meal.isVegetarian && _filters['vegetarian']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto Condensed',
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        '/categories': (context) => CategoriesScreen(),
        '/category-meals': (context) => CategoryMealsScreen(
              availabelMeals: _avialableMeals,
            ),
        '/meal-details': (context) => MealDetailsScreen(),
        '/filters': (context) => FiltersScreen(
              filters: _filters,
              onSave: _setFilters,
            ),
      },
    );
  }
}
