import 'package:flutter/material.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:reseptikirja/widgets/recipe_card.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:reseptikirja/providers/favorites_provider.dart';

// ignore: must_be_immutable
class RecipeListView extends StatelessWidget {
  RecipeListView({super.key, required this.favorites});

  bool favorites;

  @override
  Widget build(BuildContext context) {
  final favoritesProvider = Provider.of<FavoritesProvider>(context);
  final recipeController = Get.find<RecipeController>();

  return Obx(() {
    // Jos reseptejä ei ole, näytetään tyhjä tila
    if (recipeController.size == 0) {
      return Center(child: Text('No Recipes Yet'));
    }

    // Valitaan näytettävät reseptit favorites-tilan mukaan
    final List <Recipe> recipesToShow = (favorites
        ? favoritesProvider.favorites
        : recipeController.recipes.toList());

    return ListView(
      children: recipesToShow
          .map((recipe) => RecipeCard(recipe: recipe))
          .toList(),
    );
  });
}
}
