import "package:flutter/material.dart";

import "../dummy_data.dart";
import "../widgets/meal_item.dart";
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routeName = "/category-meals";

  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  bool _loadedInitData = false;
  String categoryTitle;
  List<Meal> displayedMeals;

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs["title"];
      final categoryId = routeArgs["id"];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = !_loadedInitData;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            id: displayedMeals[idx].id,
            title: displayedMeals[idx].title,
            imageUrl: displayedMeals[idx].imageUrl,
            complexity: displayedMeals[idx].complexity,
            affordability: displayedMeals[idx].affordability,
            duration: displayedMeals[idx].duration,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
