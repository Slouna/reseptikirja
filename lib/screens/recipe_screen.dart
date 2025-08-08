import 'package:flutter/material.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/screens/edit_recipe_page.dart';

class RecipeScreen extends StatelessWidget {
  RecipeScreen({super.key, required this.recipeId});
  final String recipeId;

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
            onPressed:() => Get.toNamed("/"),
             icon: Icon(Icons.home_outlined)
          )
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    await Get.to(() => EditRecipePage(recipeId: recipeId));
                  },
                ),
                IconButton(onPressed: null, icon: Icon(Icons.delete_outline)),
              ],
            ),
          ],
        );
      })
    );
  }
}
