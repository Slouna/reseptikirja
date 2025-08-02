import 'package:flutter/material.dart';

class Recipe {
  final String? name;
  final String? description;
  final String? ingridients;
  final String? steps;

  final bool? vegan;
  final bool? vegetarian;
  final bool? glutenFree;

  Recipe(
    this.name,
    this.description,
    this.ingridients,
    this.steps,
    this.vegan,
    this.vegetarian,
    this.glutenFree,
  );

  Map toJson() => {
    'name': name,
    'description': description,
    'ingridients': ingridients,
    'steps': steps,
    'vegan': vegan,
    'vegetarian': vegetarian,
    'glutenFree': glutenFree,
  };

  factory Recipe.fromJson(Map json) {
    return Recipe(
      json['name'],
      json['description'],
      json['ingridients'],
      json['steps'],
      json['vegan'],
      json['vegetarian'],
      json['glutenFree'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Recipe && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}

class FavoritesProvider with ChangeNotifier {
  final List<Recipe> _favorites = [];

  List<Recipe> get favorites => _favorites;

  void toggleFavorite(Recipe recipe) {
    if (_favorites.contains(recipe)) {
      _favorites.remove(recipe);
    } else {
      _favorites.add(recipe);
    }
    notifyListeners();
  }

  bool isFavorite(Recipe recipe) {
    return _favorites.contains(recipe);
  }
}
