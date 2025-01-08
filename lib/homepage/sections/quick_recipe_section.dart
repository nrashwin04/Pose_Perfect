import 'package:flutter/material.dart';
import '../widgets/recipe_card.dart';

class QuickRecipeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Recipes',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xFFd4a373),
          ),
        ),
        const SizedBox(height: 8.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              RecipeCard(
                title: 'Green Smoothie',
                description: 'A quick and healthy smoothie recipe.',
                image: 'assets/smoothie.jpg',
              ),
              RecipeCard(
                title: 'Avocado Toast',
                description: 'Simple and delicious avocado toast.',
                image: 'assets/avocadotoast.jpg',
              ),
              RecipeCard(
                title: 'Energy Bites',
                description: 'No-bake energy bites for a quick snack.',
                image: 'assets/energybites.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
