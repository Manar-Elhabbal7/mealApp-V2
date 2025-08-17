import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Providers/filter_provider.dart';

class Filter extends ConsumerWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    final filtersNotifier = ref.read(filtersProvider.notifier);

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
            value: filters.glutenFree,
            onChanged: (newValue) {
              filtersNotifier.setFilters(
                filters.copyWith(glutenFree: newValue),
              );
            },
          ),
          const SizedBox(height: 9),
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
            value: filters.vegan,
            onChanged: (newValue) {
              filtersNotifier.setFilters(
                filters.copyWith(vegan: newValue),
              );
            },
          ),
          const SizedBox(height: 9),
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
            value: filters.vegetarian,
            onChanged: (newValue) {
              filtersNotifier.setFilters(
                filters.copyWith(vegetarian: newValue),
              );
            },
          ),
          const SizedBox(height: 9),
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
            value: filters.lactoseFree,
            onChanged: (newValue) {
              filtersNotifier.setFilters(
                filters.copyWith(lactoseFree: newValue),
              );
            },
          ),
        ],
      ),
    );
  }
}
