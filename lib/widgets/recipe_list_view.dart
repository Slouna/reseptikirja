import 'package:flutter/material.dart';
import 'package:reseptikirja/widgets/recipe_card.dart';

class RecipeListView extends StatelessWidget {
  const RecipeListView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [RecipeCard(), RecipeCard(), RecipeCard()]),
    );
  }
}
