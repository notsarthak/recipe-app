import "package:flutter/material.dart";

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "/meal-detail";

  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text("$mealId")),
      body: Center(
        child: Text("Meal has id $mealId"),
      ),
    );
  }
}
