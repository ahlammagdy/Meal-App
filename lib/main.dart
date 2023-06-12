// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'moduls/meal_class.dart';
import 'screens/category_meals.dart';
import 'screens/filters.dart';
import 'screens/meal_details.dart';

import 'screens/my_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    "Gluten": false,
    "Lactose": false,
    "Vegan": false,
    "Vegetarian": false,
  };

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavorite(String mealId) {
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  void setFilters(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;
      availableMeal = DUMMY_MEALS.where((meal) {
        if (filters["Gluten"] == true && !meal.isGlutenFree) {
          return false;
        }
        if (filters["Lactose"] == true && !meal.isLactoseFree) {
          return false;
        }
        if (filters["Vegan"] == true && !meal.isVegan) {
          return false;
        }
        if (filters["Vegetarian"] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              titleSmall: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed')),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber)),
      routes: {
        '/': (context) => MyHome(favoriteMeals: favoriteMeals),
        '/filters': (context) => Filters(
              setFilters: setFilters,
              filters: filters,
            ),
        CategoryMeals.routName: (context) =>
            CategoryMeals(availableMeal: availableMeal),
        MealDetails.routName: (context) => MealDetails(
            toggleFavorite: toggleFavorite, isMealFavorite: isMealFavorite),
      },
    );
  }
}
