import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/widgets/recipe_card.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:get/get.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key, this.recipeData});
  final Recipe? recipeData;

  @override
  Widget build(BuildContext context) {
    final recipe = recipeData ?? Get.arguments as Recipe;
    if (recipe == null) {
      return Center(child: Text("Recipe not found"));
    }

    //var recipeName = Get.parameters["recipeName"];
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name!)),
      body:  Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
          children: [
            SizedBox(height: 25,),
            
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Ingridients",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(recipe.ingridients!),
              ),
            ),
            SizedBox(height: 25,),
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Steps",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(recipe.steps!),
              ),
            ),
          ],
        ),
      
    ));
  }
}
