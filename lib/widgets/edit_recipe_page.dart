import 'package:flutter/material.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EditRecipePage extends StatefulWidget {
  EditRecipePage({super.key, required this.recipe});
  final Recipe recipe;

  @override
  State<EditRecipePage> createState() => _EditRecipePage();
}

class _EditRecipePage extends State<EditRecipePage> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController ingredientsController;
  late TextEditingController stepsController;

  final recipeController = Get.find<RecipeController>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.recipe.name);
    descriptionController = TextEditingController(
      text: widget.recipe.description,
    );
    ingredientsController = TextEditingController(
      text: widget.recipe.ingridients,
    );
    stepsController = TextEditingController(text: widget.recipe.steps);
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    ingredientsController.dispose();
    stepsController.dispose();
    super.dispose();
  }

  void saveRecipe() {
    Recipe updatedRecipe = Recipe(
      nameController.text,
      descriptionController.text,
      ingredientsController.text,
      stepsController.text,
      widget.recipe.vegan,
      widget.recipe.vegetarian,
      widget.recipe.glutenFree,
    );

    recipeController.updateRecipe(widget.recipe, updatedRecipe);

    Get.back(result: updatedRecipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Recipe")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: ingredientsController,
              decoration: InputDecoration(labelText: "Ingredients"),
            ),
            TextField(
              controller: stepsController,
              decoration: InputDecoration(labelText: "Steps"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: saveRecipe, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
