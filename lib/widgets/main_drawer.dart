import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({String title, IconData icon, Function onPress}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onPress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Center(
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(title: 'Meals', icon: Icons.restaurant, onPress: () {}),
          buildListTile(title: 'Filters', icon: Icons.settings, onPress: () {}),
        ],
      ),
    );
  }
}
