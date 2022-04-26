import 'package:flutter/material.dart';
import '../screens/filters-screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapListener) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: tapListener,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).padding.top),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: FittedBox(
              child: Text(
                'DeliMeals',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 30),
              ),
            ),
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
