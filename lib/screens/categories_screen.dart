import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryItem(
            id: category.id,
            title: category.title,
            color: category.color,
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        padding: EdgeInsets.all(25),
      ),
    );
  }
}
