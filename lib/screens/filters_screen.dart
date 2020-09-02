import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function onSave;
  final Map<String, bool> filters;

  FiltersScreen({this.filters, this.onSave});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  initState() {
    super.initState();
    _glutenFree = widget.filters['gluten'];
    _lactoseFree = widget.filters['lactose'];
    _vegan = widget.filters['vegan'];
    _vegetarian = widget.filters['vegetarian'];
  }

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
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    widget.onSave({
                      'gluten': _glutenFree,
                      'lactose': _lactoseFree,
                      'vegan': _vegan,
                      'vegetarian': _vegetarian,
                    });
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.save,
                        size: 30,
                      ),
                      Text(
                        'Save',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
