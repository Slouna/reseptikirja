import 'package:flutter/material.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/widgets/edit_recipe_page.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class RecipeScreen extends StatelessWidget {
  RecipeScreen({super.key, required this.recipeId});
  final String recipeId;

  // TODO: Recipe id argumentiksi, korjaa kaikkialle

  final recipeController = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 106, 102, 102),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 162, 162, 157),
        title: Obx(() {
          final recipe = recipeController.recipes.firstWhere(
            (r) => r.id == recipeId,
          );
          return Text(recipe.name ?? "");
        }),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async {
              await Get.to(() => EditRecipePage(recipeId: recipeId));
            },
          ),
        ],
      ),
      body: Obx(() {
          final recipe = recipeController.recipes.firstWhere(
            (r) => r.id == recipeId,
          );
          return ListView(
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
          );
        }),
      
    );
  }
}
