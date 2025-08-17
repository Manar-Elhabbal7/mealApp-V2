import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/widgets/meal.dart';

class FavoritesNotifier extends StateNotifier<List<Meal>> {
  FavoritesNotifier() : super([]);

  void toggleFavorite(Meal meal) {
    if (state.any((m) => m.id == meal.id)) {
      state = state.where((m) => m.id != meal.id).toList();
    }
    else {
      state = [...state, meal];
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
