import 'package:flutter_riverpod/flutter_riverpod.dart';

class Filters {
  final bool glutenFree;
  final bool vegan;
  final bool vegetarian;
  final bool lactoseFree;

  const Filters({
    this.glutenFree = false,
    this.vegan = false,
    this.vegetarian = false,
    this.lactoseFree = false,
  });

  Filters copyWith({
    bool? glutenFree,
    bool? vegan,
    bool? vegetarian,
    bool? lactoseFree,
  }) 
  {
    return Filters(
      glutenFree: glutenFree ?? this.glutenFree,
      vegan: vegan ?? this.vegan,
      vegetarian: vegetarian ?? this.vegetarian,
      lactoseFree: lactoseFree ?? this.lactoseFree,
    );
  }
}

class FiltersNotifier extends StateNotifier<Filters> {
  FiltersNotifier() : super(const Filters());

  void setFilters(Filters filters) {
    state = filters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Filters>(
  (ref) => FiltersNotifier(),
);
