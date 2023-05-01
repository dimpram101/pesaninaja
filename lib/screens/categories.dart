import 'package:flutter/material.dart';
import 'package:pesaninaja/data/dummy_data.dart';
import 'package:pesaninaja/models/category.dart';
import 'package:pesaninaja/models/meal.dart';
import 'package:pesaninaja/screens/meals.dart';
import 'package:pesaninaja/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(Meal meal) onToggleFavorite;

  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
  });

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeal,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () => _selectCategory(context, category),
          )
      ],
    );
  }
}
