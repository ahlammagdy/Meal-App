import 'package:flutter/material.dart';

import '../moduls/meal_class.dart';
import '../widget/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const routName = 'category_meals';
  const CategoryMeals({super.key, required this.availableMeal});

  final List<Meal> availableMeal;

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  late String categoryTitle;
  late List<Meal> categoryMeal;

  @override
  void didChangeDependencies() {
    final routeAgr =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeAgr['id'];
    categoryTitle = routeAgr['title']!;
    categoryMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  // void removeMeal(String mealId) {
  //   setState(() {
  //     categoryMeal.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeal.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            imageURL: categoryMeal[index].imageURL,
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
            duration: categoryMeal[index].duration,
            title: categoryMeal[index].title,
            id: categoryMeal[index].id,
          );
        },
      ),
    );
  }
}
