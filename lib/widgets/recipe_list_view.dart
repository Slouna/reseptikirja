import 'package:flutter/material.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/widgets/recipe_card.dart';
import 'package:get/get.dart';

class RecipeListView extends StatelessWidget {
  RecipeListView({super.key, this.userID});
  final recipeController = Get.find<RecipeController>();

  final userID;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => recipeController.size == 0
          ? Center(child: Text('No Recipes Yet'))
          : ListView(
              children: recipeController.recipes
                  .map(
                    (recipe) => RecipeCard(
                      name: recipe.name,
                      description: recipe.description,
                    ),
                  )
                  .toList(),
            ),
    );

  }
}
