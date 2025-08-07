import 'package:get/get.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class RecipeController {
  final storage = Hive.box("storage");

  RxList <Recipe> recipes;

  RecipeController() : recipes = <Recipe>[].obs {
    if (storage.get("recipes") == null) {
      storage.put("recipes", []);
    }

    recipes.value = (storage
        .get("recipes") as List)
        .map((recipe) => Recipe.fromJson(Map<String, dynamic>.from(recipe)))
        .toList();
  }

  void _save() {
    storage.put("recipes", recipes.map((recipe) => recipe.toJson()).toList());
  }

  void add(Recipe recipe) {
    recipes.add(recipe);
    _save();
  }

  void updateRecipe(Recipe originalRecipe, Recipe updatedRecipe) {
    recipes[recipes.indexWhere((r) => r == originalRecipe)] = updatedRecipe;
    _save();
  }

  void delete(Recipe recipe) {
    recipes.removeWhere((r) => r.id == recipe.id);
    _save();
  }

  get size => recipes.length;
}
