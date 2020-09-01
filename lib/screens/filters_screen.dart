import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget switchListBuilder(
      {String title, String subtitle, bool value, Function onChange}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                switchListBuilder(
                  title: 'Gluten Free',
                  subtitle: 'Only include gluten free meals',
                  value: _glutenFree,
                  onChange: (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                ),
                switchListBuilder(
                  title: 'Lactose Free',
                  subtitle: 'Only include lactose free meals',
                  value: _lactoseFree,
                  onChange: (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                ),
                switchListBuilder(
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals',
                  value: _vegan,
                  onChange: (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                ),
                switchListBuilder(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegetarian meals',
                  value: _vegetarian,
                  onChange: (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
