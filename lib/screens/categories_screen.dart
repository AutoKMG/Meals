import 'package:flutter/material.dart';
import 'package:meals/dummy-data.dart';
import 'package:meals/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(
            color: catData.color,
            title: catData.title,
            id: catData.id,
          );
        }).toList(),
      );
  }
}
