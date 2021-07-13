import "package:flutter/material.dart";

import "./dummy_data.dart";

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = "/category-meals";

  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return Text(categoryMeals[idx].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
