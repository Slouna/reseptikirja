import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:provider/provider.dart';
import 'package:reseptikirja/providers/favorites_provider.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});
  final Recipe recipe;

  String getName() {
    return recipe.name!;
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    return Card(
      color: Color.fromARGB(255, 211, 179, 217),
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
                    favoritesProvider.isFavorite(recipe.id)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  onPressed: () {
                    favoritesProvider.toggleFavorite(recipe.id);
                  },
                ),
                ElevatedButton(
                  onPressed: () => Get.toNamed("/recipe/${recipe.id}"),
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 211, 179, 217)) ),
                  child: const Text("Go to recipe"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

