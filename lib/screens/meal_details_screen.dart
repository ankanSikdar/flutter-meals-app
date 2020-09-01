import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == id);

    Widget buildTitle({String title}) {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildList({Widget child}) {
      return Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.8,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all()),
          child: child);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(title: 'Ingridients'),
            buildList(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            buildTitle(title: 'Steps'),
            buildList(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(meal.steps[index]),
                );
              },
              itemCount: meal.steps.length,
            ))
          ],
        ),
      ),
    );
  }
}
