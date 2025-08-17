import 'package:flutter/material.dart';

class DrawerC extends StatelessWidget {
  const DrawerC({
    super.key,
    required this.onSelectScreen
  });

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 40,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                const SizedBox(width: 20,),
                Text(
                  'Meal Time',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            )
          ),
            ListTile(
              onTap: () {
                onSelectScreen('meals');
              },
              leading: Icon(
                Icons.restaurant,
                size: 26,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                'Meals',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                onSelectScreen('filters');
              },
              leading: Icon(
                Icons.settings,
                size: 26,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                'Filters',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            ),
          ),
        ],
      )
    );
  }
}