import "package:flutter/material.dart";

import "../models/meal.dart";

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  MealItem({
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.title,
    @required this.imageUrl,
  });

  void selectMeal() {}

  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
