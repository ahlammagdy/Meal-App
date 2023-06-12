import 'package:flutter/material.dart';
import 'package:meal_app/moduls/meal_class.dart';
import 'package:meal_app/screens/favorite_meals.dart';

import 'category_screen.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key, required this.favoriteMeals});

  final List<Meal> favoriteMeals;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late List pages;

  int currentIndex = 0;

  @override
  void initState() {
    pages = [
      const CategoryScreen(),
      FavoriteMeals(
        favoriteMeals: widget.favoriteMeals,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
        backgroundColor: Colors.pink,
      ),
    );
  }
}
