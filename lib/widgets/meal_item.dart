import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
    required this.onToggleFav,
    required this.isFav,
  });

  final Meal meal;
  final VoidCallback onSelectMeal;
  final void Function(Meal meal) onToggleFav;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onSelectMeal,
        child: Row(
          children: [
            Image.network(
              meal.imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ListTile(
                title: Text(meal.title),
                subtitle: Text(meal.duration.toString()),
                trailing: IconButton(
                  icon: Icon(isFav ? Icons.star : Icons.star_border),
                  onPressed: () => onToggleFav(meal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
