import 'package:flutter/material.dart';
import 'package:meals/screens/meal-detail-screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final int previousPage;

  MealItem({
    @required this.imageUrl,
    @required this.duration,
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.id,
    @required this.previousPage,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unkown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unkown';
    }
  }

  void selectItem(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName,
        arguments: {'id': id, 'pageId': previousPage}).then((removedItem) {
      if (removedItem != null) {
        //return removeMeal(removedItem);
      }
    });
  }

  Widget buildMealInfo(IconData icon, String text) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 27,
            ),
            SizedBox(
              width: 6,
            ),
            Expanded(
                child: Text(
              text,
              style: TextStyle(fontSize: 15),
            ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectItem(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 270,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black54),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildMealInfo(Icons.schedule, '$duration min'),
                  buildMealInfo(Icons.work, '$complexityText'),
                  buildMealInfo(Icons.attach_money, '$affordabilityText'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
