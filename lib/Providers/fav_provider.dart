import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/widgets/meal.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>> {
  FavoritesNotifier() : super([]);

  bool toggleFavorite(Meal meal) {
      final isFav = state.contains(meal);
      if (isFav) {
        state = state.where((m) => m.id != meal.id).toList();
        return false; // removed
      } 
      else {
        state = [...state, meal];
        return true; // added
      }
    }
  

  bool isFavorite(Meal meal) {
    return state.any((m) => m.id == meal.id);
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<Meal>>((ref) {
  return FavoritesNotifier();
});
