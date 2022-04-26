import 'package:flutter/material.dart';
import 'package:meals/dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavorite;
  final Function checkFavorite;
  MealDetailScreen(this.toggleFavorite, this.checkFavorite);
  static const routeName = '/meal-detail-screen';
  Widget buildSectionTitle(context, title) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget buildContainer(body, mediaQuery) {
    return Container(
      width: mediaQuery.size.width * 0.7,
      height: mediaQuery.size.height * 0.30,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final mealData = ModalRoute.of(context).settings.arguments as Map;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => (meal.id == mealData['id']));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.network(selectedMeal.imageUrl),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                      color: Theme.of(context).accentColor),
                  itemCount: selectedMeal.ingredients.length,
                ),
                mediaQuery),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
                mediaQuery)
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            checkFavorite(mealData['id']) ? Icons.star : Icons.star_border,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).accentColor,
          onPressed: () =>
              toggleFavorite(mealData['id'], mealData['pageId'], context)),
    );
  }
}
