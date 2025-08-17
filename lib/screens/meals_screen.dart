import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/widgets/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFav,
    required this.isMealFav,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFav;
  final bool Function(Meal meal) isMealFav;

  void _openDetails(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(
          meal: meal,
          onToggleFavorite: onToggleFav,
          isFav: isMealFav(meal),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = meals.isEmpty
        ? Center(
            child: Text(
              'No meals found here.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, i) {
              final m = meals[i];
              return MealItem(
                meal: m,
                onSelectMeal: () => _openDetails(context, m),
                //onToggleFavourite: onToggleFav,
                //isFav: isMealFav(m),
              );
            },
          );

    if (title == null) return content;

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
