import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class FavoritesProvider extends ChangeNotifier {
  
  final Box _favoritesBox = Hive.box("favorites");

  List<String> _favoriteRecipeIds = [];

  FavoritesProvider() {
    // Ladataan suosikit tallennuksesta
    final stored = _favoritesBox.get("favorites");
    if (stored != null) {
      _favoriteRecipeIds = List<String>.from(stored);
    }
  }

  List<Recipe> get favorites => _favoriteRecipeIds
    .map((id) => Get.find<RecipeController>().recipes.firstWhereOrNull((recipe) => recipe.id == id,))
    .where((recipe) => recipe != null)
    .cast<Recipe>()
    .toList();

  bool isFavorite(String recipeId) {
    return _favoriteRecipeIds.contains(recipeId);
  }

  void toggleFavorite(String recipeId) {
    if (_favoriteRecipeIds.contains(recipeId)) {
      _favoriteRecipeIds.remove(recipeId);
    } else {
      _favoriteRecipeIds.add(recipeId);
    }
    _save();
    notifyListeners();
  }

  void _save() {
    _favoritesBox.put("favorites", _favoriteRecipeIds);
  }
}

