import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Recipe {
  final String id;
  final String? name;
  final String? description;
  final String? ingridients;
  final String? steps;

  final bool? vegan;
  final bool? vegetarian;
  final bool? glutenFree;

  Recipe({
    String? id,
    this.name,
    this.description,
    this.ingridients,
    this.steps,
    this.vegan,
    this.vegetarian,
    this.glutenFree,
  }) : id = id ?? uuid.v4();


  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'ingridients': ingridients,
    'steps': steps,
    'vegan': vegan,
    'vegetarian': vegetarian,
    'glutenFree': glutenFree,
  };

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      ingridients:  json['ingridients'],
      steps: json['steps'],
      vegan:  json['vegan'],
      vegetarian:  json['vegetarian'],
      glutenFree:  json['glutenFree'],
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
