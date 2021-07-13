import "package:flutter/material.dart";

class CategoryMealsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Meals"),
      ),
      body: Center(
        child: Text("These are the meals of this category"),
      ),
    );
  }
}
