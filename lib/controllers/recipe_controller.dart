import 'package:get/get.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class RecipeController {
  final storage = Hive.box("storage");

  RxList recipes;

  RecipeController() : recipes = [].obs {
    if (storage.get("recipes") == null) {
      storage.put("recipes", []);
    }

    recipes.value = storage
        .get("recipes")
        .map((recipe) => Recipe.fromJson(recipe))
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
    int i = 0;
    for (Recipe r in recipes) {
      if (r == originalRecipe) {
        break;
      }
      i++;
    }
    recipes[i] = updatedRecipe;
    _save();
  }

  void delete(Recipe recipe) {
    recipes.remove(recipe);
    recipes.refresh();
    _save();
  }

  get size => recipes.length;
}
