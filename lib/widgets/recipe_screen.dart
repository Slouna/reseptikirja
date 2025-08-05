import 'package:flutter/material.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/widgets/edit_recipe_page.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class RecipeScreen extends StatelessWidget {
  RecipeScreen({super.key, this.recipeData});
  final Recipe? recipeData;

  final recipeController = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    final recipe = recipeData ?? Get.arguments as Recipe;

    //var recipeName = Get.parameters["recipeName"];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 106, 102, 102),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 162, 162, 157),
        title: Text(recipe.name!),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              final updatedRecipe = await Get.to<Recipe>(
                () => EditRecipePage(recipe: recipe),
              );
              if (updatedRecipe != null) {
                //recipeController.updateRecipe(recipe, updatedRecipe);
                print(updatedRecipe.name);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 25),

            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Ingridients",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(recipe.ingridients!),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Steps",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(recipe.steps!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
