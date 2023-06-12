// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details.dart';

import '../moduls/meal_class.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.imageURL,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.id,
  });

  final String imageURL;
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get complexitytext {
    switch (complexity) {
      case Complexity.simple:
        return 'simple';

      case Complexity.challenging:
        return 'challenging';

      case Complexity.hard:
        return 'hard';
      default:
        return 'unknowen';
    }
  }

  String get affordabilitytext {
    switch (affordability) {
      case Affordability.affordable:
        return 'affordable';

      case Affordability.luxurious:
        return 'luxurious';

      case Affordability.pricey:
        return 'pricey';
      default:
        return 'unknowen';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetails.routName, arguments: {
      'id': id,
    }).then((result) {
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageURL,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    color: Colors.black54,
                    width: 300,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexitytext),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      Text(affordabilitytext),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
