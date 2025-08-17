import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/data/dummy_data.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPageIndex = 0;
  final List<Meal> favMeals = [];

  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectPage(int idx) {
    setState(() {
      _selectedPageIndex = idx;
    });
  }

  void _toggleMealfav(Meal meal) {
    final isExisting = favMeals.any((m) => m.id == meal.id);
    if (isExisting) {
      setState(() {
        favMeals.removeWhere((m) => m.id == meal.id);
      });
      _showMessage('Meal is no longer a favorite.');
    } else {
      setState(() {
        favMeals.add(meal);
      });
      _showMessage('Marked as favorite.');
    }
  }

  bool _isMealFav(Meal meal) {
    return favMeals.any((m) => m.id == meal.id);
  }

  List<Meal> _applyFilters(List<Meal> meals) {
    return meals.where((meal) {
      if (_glutenFree && !meal.isGlutenFree) return false;
      if (_vegan && !meal.isVegan) return false;
      if (_vegetarian && !meal.isVegetarian) return false;
      if (_lactoseFree && !meal.isLactoseFree) return false;
      return true;
    }).toList();
  }

  void _handleDrawerSelection(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'meals') {
      setState(() {
        _selectedPageIndex = 0;
      });
    } 
    else if (identifier == 'filters') {
      final selectedFilters = await Navigator.of(context).push<Map<String,bool>>(
      MaterialPageRoute(
        builder: (_) => Filter(
          glutenFree: _glutenFree,
          vegan: _vegan,
          vegetarian: _vegetarian,
          lactoseFree: _lactoseFree,
        ),
      ),
    );

      if (selectedFilters != null) {
        setState(() {
          _glutenFree = selectedFilters['glutenFree'] ?? false;
          _vegan = selectedFilters['vegan'] ?? false;
          _vegetarian = selectedFilters['vegetarian'] ?? false;
          _lactoseFree = selectedFilters['lactoseFree'] ?? false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      onToggleFav: _toggleMealfav,
      isMealFav: _isMealFav,
      favMeals: favMeals,
      filteredMeals: _applyFilters(dummyMeals),
    );

    var activePageTitle = 'Pick Your Category';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favMeals,
        onToggleFav: _toggleMealfav,
        isMealFav: _isMealFav,
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
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
