import 'package:flutter/material.dart';
import 'package:meals/widgets/main-drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> savedFilters;
  FiltersScreen({this.saveFilters,this.savedFilters});
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  @override
  initState(){
    _glutenFree = widget.savedFilters['gluten-free'];
    _vegan = widget.savedFilters['vegan'];
    _vegetarian = widget.savedFilters['vegetarian'];
    _lactoseFree = widget.savedFilters['lactose-free'];
    super.initState();
  }
  Widget buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save),onPressed: (
            ){
              final selectedFilters = {
                'gluten-free':_glutenFree,
                'lactose-free':_lactoseFree,
                'vegan':_vegan,
                'vegetarian':_vegetarian
              };
              widget.saveFilters(selectedFilters);
            },)
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(children: [
                buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals.', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegan', 'Only include vegan meals.', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
              ]),
            )
          ],
        ));
  }
}
