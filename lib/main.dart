import 'package:flutter/material.dart';
import 'package:meals/dummy-data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/error-page-screen.dart';
import 'package:meals/screens/meal-detail-screen.dart';
import 'package:meals/screens/tabs-screen.dart';

import './screens/filters-screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];
  void setFilters(Map<String, bool> filterData) {
    setState(() {
      availableMeals = DUMMY_MEALS.where((meal) {
        filters = filterData;
        if (filters['gluten-free'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose-free'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }
  void restartFavoritesScreen(String mealId){
    setState(() {
      favoriteMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
  void toggleFavorite(String id,int pageId, BuildContext ctx) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == id);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
        if (pageId == 0){
          Navigator.of(ctx).pop(id);
        }
        });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool checkFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals,restartFavoritesScreen),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(toggleFavorite, checkFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              savedFilters: filters,
              saveFilters: setFilters,
            ),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => ErrorPageScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => ErrorPageScreen());
      },
    );
  }
}