import "package:flutter/material.dart";

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(this.categoryId, this.categoryTitle);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text("These are the meals of this category"),
      ),
    );
  }
}
