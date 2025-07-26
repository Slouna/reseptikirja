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
}
