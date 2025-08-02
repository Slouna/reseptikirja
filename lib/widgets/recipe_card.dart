import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/widgets/recipe_screen.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:provider/provider.dart';

class RecipeCard extends StatelessWidget {
  RecipeCard({super.key, required this.recipe});
  final Recipe recipe;

  String getName() {
    return recipe.name!;
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    return Card(
      child: ExpandablePanel(
        header: Container(
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(recipe.name!, style: TextStyle(fontSize: 16)),
          ),
        ),
        collapsed: Container(
          padding: EdgeInsets.all(10),
          child: Text(recipe.description!),
        ),
        expanded: Column(
          children: [
            Text("Ingridients", style: const TextStyle(fontStyle: FontStyle.italic)),
            Text(recipe.ingridients ?? ""),
            Text("Steps", style: const TextStyle(fontStyle: FontStyle.italic)),
            Text(recipe.steps ?? ""),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    favoritesProvider.isFavorite(recipe)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  onPressed: () {
                    favoritesProvider.toggleFavorite(recipe);
                  },
                ),
                IconButton(
                  onPressed: () => Get.toNamed("/recipe/${recipe.name}", arguments: recipe),
                  icon: const Icon(Icons.edit),
                  tooltip: "Edit recipe",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

