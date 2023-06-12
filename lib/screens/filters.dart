import 'package:flutter/material.dart';
import 'package:meal_app/widget/main_drawer.dart';

class Filters extends StatefulWidget {
  const Filters({
    super.key,
    required this.setFilters,
    required this.filters,
  });
  final Map<String, bool> filters;
  final Function setFilters;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  initState() {
    isGlutenFree = widget.filters['Gluten']!;
    isLactoseFree = widget.filters['Lactose']!;
    isVegan = widget.filters['Vegan']!;
    isVegetarian = widget.filters['Vegetarian']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  "Gluten": isGlutenFree,
                  "Lactose": isLactoseFree,
                  "Vegan": isVegan,
                  "Vegetarian": isVegetarian,
                };
                widget.setFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: const Text('Gluten Free'),
                  subtitle: const Text("only include gluten free meals"),
                  value: isGlutenFree,
                  onChanged: (val) {
                    setState(() {
                      isGlutenFree = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Lactose Free'),
                  subtitle: const Text("only include lactose free meals"),
                  value: isLactoseFree,
                  onChanged: (val) {
                    setState(() {
                      isLactoseFree = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegan'),
                  subtitle: const Text("only include Vegan meals"),
                  value: isVegan,
                  onChanged: (val) {
                    setState(() {
                      isVegan = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Vegetarian'),
                  subtitle: const Text("only include Vegetarian meals"),
                  value: isVegetarian,
                  onChanged: (val) {
                    setState(() {
                      isVegetarian = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
