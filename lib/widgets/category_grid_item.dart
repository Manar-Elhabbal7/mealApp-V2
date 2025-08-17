import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/category.dart';
import 'package:meal_app/widgets/meal.dart';

class CategoryGridItem extends StatelessWidget {
    const CategoryGridItem({
    super.key,
    required this.category,
    required this.onToggleFav,
    required this.isMealFav,
    required this.favMeals,
    required this.meals
  });

  final CategoryC category;
  final void Function(Meal meal) onToggleFav;
  final bool Function(Meal meal) isMealFav;
  final List<Meal> favMeals;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MealsScreen(
              title: category.title,
              meals: meals,
              onToggleFav: onToggleFav,
              isMealFav: isMealFav,
            ),
          ),
        );
      },  
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
