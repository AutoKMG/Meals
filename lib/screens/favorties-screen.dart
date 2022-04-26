import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '../widgets/meal_item.dart';
class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  final Function restartFavoritesScreen;
  FavoritesScreen(this.favoriteMeals,this.restartFavoritesScreen);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favoriteMeals.isEmpty){
      return Center(child: Text("You didn't mark any meal as favorite",style: Theme.of(context).textTheme.title,),);
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: widget.favoriteMeals[index].id,
              imageUrl: widget.favoriteMeals[index].imageUrl,
              duration: widget.favoriteMeals[index].duration,
              affordability: widget.favoriteMeals[index].affordability,
              complexity: widget.favoriteMeals[index].complexity,
              title: widget.favoriteMeals[index].title,
              previousPage: 0,
            );
          },
          itemCount: widget.favoriteMeals.length,
        );
    }
  }
}