import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorties-screen.dart';
import 'package:meals/widgets/main-drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favortieMeals;
  final Function restartFavoritesScreen;
  TabsScreen(this.favortieMeals,this.restartFavoritesScreen);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  @override
  initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favortieMeals,widget.restartFavoritesScreen), 'title': 'Favorites'}
    ];
    super.initState();
  }

  int _selectedIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      body: _pages[_selectedIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favorites'))
        ],
      ),
    );
  }
}
