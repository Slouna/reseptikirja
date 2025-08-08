import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';

class CustomSearchDelegate extends SearchDelegate {
  static final recipeController = Get.find<RecipeController>();
  List<Recipe> get recipes => recipeController.recipes;

  List<String> searchTerms = recipeController.recipes
      .map((recipe) => recipe.name!.toString())
      .toList();

  Recipe findById(String id) {
    for (var i in recipeController.recipes) {
      if (i.id == id) {
        return i;
      }
    }
    throw ArgumentError(id);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = "", icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Recipe> matchQuery = recipes
        .where((recipe) =>
            recipe.name != null &&
            recipe.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var recipe = matchQuery[index];
        return ListTile(
          title: Text(recipe.name ?? "Unnamed recipe"),
          onTap: () =>
              Get.toNamed("/recipe/${recipe.id}", arguments: findById(recipe.id)),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Recipe> matchQuery = recipes
        .where((recipe) =>
            recipe.name != null &&
            recipe.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var recipe = matchQuery[index];
        return ListTile(
          title: Text(recipe.name ?? "Unnamed recipe"),
          onTap: () =>
              Get.toNamed("/recipe/${recipe.id}", arguments: findById(recipe.id)),
        );
      },
    );
  }
}
