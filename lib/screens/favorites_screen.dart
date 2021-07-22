import "package:flutter/material.dart";

import '../models/meal.dart';
import "../widgets/meal_item.dart";

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.length == 0)
      return Center(
        child: Text(
          "You have no favorites yet - start adding some!",
        ),
      );
    else
      return ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: favoriteMeals[idx].id,
            title: favoriteMeals[idx].title,
            imageUrl: favoriteMeals[idx].imageUrl,
            complexity: favoriteMeals[idx].complexity,
            affordability: favoriteMeals[idx].affordability,
            duration: favoriteMeals[idx].duration,
          );
        },
        itemCount: favoriteMeals.length,
      );
  }
}
