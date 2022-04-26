import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  @required
  final String id;
  @required
  final List<String> categories;
  @required
  final String title;
  @required
  final String imageUrl;
  @required
  final List<String> ingredients;
  @required
  final List<String> steps;
  @required
  final int duration;
  @required
  final Complexity complexity;
  @required
  final Affordability affordability;
  @required
  final bool isGlutenFree;
  @required
  final bool isVegan;
  @required
  final bool isVegetarian;
  @required
  final bool isLactoseFree;
  const Meal(
      {this.id,
      this.title,
      this.affordability,
      this.categories,
      this.complexity,
      this.duration,
      this.imageUrl,
      this.ingredients,
      this.isGlutenFree,
      this.isLactoseFree,
      this.isVegan,
      this.isVegetarian,
      this.steps});
}
