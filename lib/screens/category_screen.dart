import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import 'package:meal_app/widgets/meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.onToggleFav,
    required this.isMealFav,
    required this.favMeals,
    required this.filteredMeals,
  });

  final void Function(Meal meal) onToggleFav;
  final bool Function(Meal meal) isMealFav;
  final List<Meal> favMeals;
  final List<Meal> filteredMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onToggleFav: onToggleFav,
            isMealFav: isMealFav,
            favMeals: favMeals,
          ),
      ],
    );
  }
}
