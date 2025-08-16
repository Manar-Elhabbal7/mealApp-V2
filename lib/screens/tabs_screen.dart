import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart'; 

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPageIndex = 0;
  final List<Meal> favMeals = [];

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
    } 
    else {
      setState(() {
        favMeals.add(meal);
      });
      _showMessage('Marked as favorite.');
    }
  }

  bool _isMealFav(Meal meal) {
    return favMeals.any((m) => m.id == meal.id);
  }

  void _handleDrawerSelection(String identifier) {
  Navigator.of(context).pop(); // close the drawer
  if (identifier == 'meals') {
    setState(() {
      _selectedPageIndex = 0; // Categories tab
    });
  } else if (identifier == 'filters') {
    // Navigate to Filters screen
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const Filter()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      onToggleFav: _toggleMealfav,
      isMealFav: _isMealFav,
      favMeals: favMeals,
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
