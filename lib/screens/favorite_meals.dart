import 'package:flutter/material.dart';
import 'package:meal_app/widget/main_drawer.dart';

import '../moduls/meal_class.dart';
import '../widget/meal_item.dart';

class FavoriteMeals extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteMeals({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Your Favorite Meals"),
        ),
        body: const Center(
          child: Text("You have no favorites yes - start adding some!"),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Your Favorite Meals"),
        ),
        body: ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (BuildContext context, int index) {
            return MealItem(
              imageURL: favoriteMeals[index].imageURL,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration,
              title: favoriteMeals[index].title,
              id: favoriteMeals[index].id,
            );
          },
        ),
        drawer: const MainDrawer(),
      );
    }
  }
}
