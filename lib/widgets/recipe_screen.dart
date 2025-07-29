import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/widgets/recipe_card.dart';
import 'package:get/get.dart';

class RecipeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var recipeName = Get.parameters["recipeName"];
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
        backgroundColor: (const Color.fromARGB(255, 239, 237, 237)),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            ElevatedButton(onPressed: () => Get.back(), child: Text("Back to main screen")),
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("Name", style: TextStyle(fontSize: 16)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Ingridients",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text("recipe.ingridents"),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Steps",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            Container(padding: EdgeInsets.all(5), child: Text("recipe.steps")),
          ],
        ),
      ),
    );
  }
}
