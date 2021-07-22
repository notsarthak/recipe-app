import 'package:flutter/material.dart';

// import "./screens/categories_screen.dart";
import "./screens/category_meals_screen.dart";
import "./screens/meal_detail_screen.dart";
import "./screens/tabs_screen.dart";
import "./screens/filters_screen.dart";
import "./dummy_data.dart";
import "./models/meal.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"] && !meal.isGlutenFree)
          return false;
        else if (_filters["lactose"] && !meal.isLactoseFree)
          return false;
        else if (_filters["vegan"] && !meal.isVegan)
          return false;
        else if (_filters["vegetarian"] && !meal.isVegetarian)
          return false;
        else
          return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    setState(() {
      int existingIndex =
          _favoriteMeals.indexWhere((meal) => meal.id == mealId);
      if (existingIndex == -1)
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      else
        _favoriteMeals.removeAt(existingIndex);
    });
  }

  bool _isFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "RobotoCondensed",
              ),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute:
          '/', //default value is '/' so no need to specify this property here but in case we want screen corresponding to a particular route to load up on app startup, we can specify its route here
      routes: {
        '/': (_) => TabsScreen(_favoriteMeals),
        // "/category-meals": (_) => CategoryMealsScreen(),
        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(_toggleFavorite, _isFavorite),
        FiltersScreen.routeName: (_) => FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   print(settings.name);
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },
    );
  }
}
