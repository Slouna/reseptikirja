import 'package:flutter/material.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:reseptikirja/widgets/recipe_card.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RecipeListView extends StatelessWidget {
  RecipeListView({super.key, required this.favourites});

  bool favourites;

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final recipeController = Get.find<RecipeController>();
    return Obx(
      () => recipeController.size == 0
          ? Center(child: Text('No Recipes Yet'))
          : favourites
          ? ListView(
              children: favoritesProvider.favorites
                  .map((recipe) => RecipeCard(recipe: recipe))
                  .toList(),
            )
          : ListView(
              children: recipeController.recipes
                  .map((recipe) => RecipeCard(recipe: recipe))
                  .toList(),
            ),
    );
  }
}
