import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';

class CustomSearchDelegate extends SearchDelegate {
  static final recipeController = Get.find<RecipeController>();

  List<String> searchTerms = recipeController.recipes
      .map((recipe) => recipe.name!.toString())
      .toList();

  Recipe findByName(String name) {
    for (var i in recipeController.recipes) {
      if (i.name == name) {
        return i;
      }
    }
    throw ArgumentError(name);
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
    List<String> matchQuery = [];
    for (var recipe in searchTerms) {
      if (recipe.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(recipe);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () =>
              Get.toNamed("/recipe/${result}", arguments: findByName(result)),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var recipe in searchTerms) {
      if (recipe.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(recipe);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () =>
              Get.toNamed("/recipe/${result}", arguments: findByName(result)),
        );
      },
    );
  }
}
