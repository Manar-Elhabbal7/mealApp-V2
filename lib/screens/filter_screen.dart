import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  final bool glutenFree;
  final bool vegan;
  final bool vegetarian;
  final bool lactoseFree;

  const Filter({
    super.key,
    required this.glutenFree,
    required this.vegan,
    required this.vegetarian,
    required this.lactoseFree,
  });

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  late bool _glutenFree;
  late bool _vegan;
  late bool _vegetarian;
  late bool _lactoseFree;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.glutenFree;
    _vegan = widget.vegan;
    _vegetarian = widget.vegetarian;
    _lactoseFree = widget.lactoseFree;
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
            icon :const Icon(Icons.save),
            tooltip: 'Save',
            onPressed: () {
              final selectedFilters = {
                'glutenFree': _glutenFree,
                'lactoseFree': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              Navigator.of(context).pop(selectedFilters);
            },

          )
        ],
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
