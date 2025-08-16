import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

enum FilterOptions {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}
class _FilterState extends State<Filter> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              'Gluten Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            value: _glutenFree,
            onChanged: (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            },
          ),
          const SizedBox(height:9),
          SwitchListTile(
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            value: _vegan,
            onChanged: (newValue) {
              setState(() {
                _vegan = newValue;
              });
            },
          ),
          const SizedBox(height:9),
          SwitchListTile(
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                ),
            ),
            value: _vegetarian,
            onChanged: (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            },
          ),
          const SizedBox(height:9),
          SwitchListTile(
            title: Text(
              'Lactose Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                ),
            ),
            subtitle: Text(
              'Only include lactose-free meals',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            value: _lactoseFree,
            onChanged: (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
