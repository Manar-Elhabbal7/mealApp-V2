import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Providers/fav_provider.dart';
import 'package:meal_app/Providers/filter_provider.dart';
import 'package:meal_app/Providers/meals_provider.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/widgets/meal.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs> {
  int _selectedPageIndex = 0;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectPage(int idx) {
    setState(() {
      _selectedPageIndex = idx;
    });
  }

  Future<void> _handleDrawerSelection(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'meals') {
      setState(() {
        _selectedPageIndex = 0;
      });
    } 
    else if (identifier == 'filters') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const Filter(), 
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final favorites = ref.watch(favoritesProvider);
    final filters = ref.watch(filtersProvider);

    final List<Meal> filteredMeals = meals.where((meal) {
      if (filters.glutenFree && !meal.isGlutenFree) return false;
      if (filters.vegan && !meal.isVegan) return false;
      if (filters.vegetarian && !meal.isVegetarian) return false;
      if (filters.lactoseFree && !meal.isLactoseFree) return false;
      return true;
    }).toList();

    
    Widget activePage;
    String activePageTitle;

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favorites,
        onToggleFav: (meal) {
          ref.read(favoritesProvider.notifier).toggleFavorite(meal);
          _showMessage(
            ref.read(favoritesProvider.notifier).isFavorite(meal)
                ? 'Marked as favorite.'
                : 'Meal is no longer a favorite.',
          );
        },
        isMealFav: (meal) =>
            ref.read(favoritesProvider.notifier).isFavorite(meal),
      );
      activePageTitle = 'Favorites';
    } 
    else {
      activePage = CategoryScreen(
        onToggleFav: (meal) {
          ref.read(favoritesProvider.notifier).toggleFavorite(meal);
          _showMessage(
            ref.read(favoritesProvider.notifier).isFavorite(meal)
                ? 'Marked as favorite.'
                : 'Meal is no longer a favorite.',
          );
        },
        isMealFav: (meal) =>
            ref.read(favoritesProvider.notifier).isFavorite(meal),
        favMeals: favorites,
        filteredMeals: filteredMeals,
      );
      activePageTitle = 'Pick Your Category';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: DrawerC(onSelectScreen: _handleDrawerSelection),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
