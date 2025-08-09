import 'package:flutter/material.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/utils/utils.dart';

// ignore: must_be_immutable
class EditRecipePage extends StatefulWidget {
  const EditRecipePage({super.key, required this.recipeId});
  final String recipeId;

  @override
  State<EditRecipePage> createState() => _EditRecipePage();
}

class _EditRecipePage extends State<EditRecipePage> {
  /*
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController ingredientsController;
  late TextEditingController stepsController;
  */
  static final _formKey = GlobalKey<FormBuilderState>();
  final recipeController = Get.find<RecipeController>();
  late Recipe recipe;

  @override
  void initState() {
    recipe = recipeController.recipes.firstWhere(
      (r) => r.id == widget.recipeId,
    );
    super.initState();
  }

  /*
  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    ingredientsController.dispose();
    stepsController.dispose();
    super.dispose();
  }
*/
  void saveRecipe() {
    if (_formKey.currentState!.saveAndValidate()) {
      Recipe updatedRecipe = Recipe(
        id: recipe.id,
        name: _formKey.currentState!.value['name'],
        description: _formKey.currentState!.value["description"],
        ingridients: _formKey.currentState!.value["ingridients"],
        steps: _formKey.currentState!.value["steps"],
        vegan: recipe.vegan,
        vegetarian: recipe.vegetarian,
        glutenFree: recipe.glutenFree,
      );
      recipeController.updateRecipe(recipe, updatedRecipe);
      _formKey.currentState?.reset();
      
      Get.back(result: updatedRecipe);
      showSuccess("Recipe edited!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 185, 185),
      appBar: AppBar(
        title: Text("Edit Recipe"),
        backgroundColor: Color.fromARGB(255, 211, 179, 217),
        
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            children: [
              Container(
              padding: EdgeInsets.all(5),
              child: FormBuilderTextField(
                name: "name",
                initialValue: recipe.name,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Name of the Dish",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: FormBuilderValidators.required(),
              ),
              ),
              Container(
              padding: EdgeInsets.all(5),
              child: FormBuilderTextField(
                name: "description",
                initialValue: recipe.description,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 2,
                decoration: InputDecoration(
                  hintText: "Short Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: FormBuilderValidators.required(),
              ),
              ),
              Container(
              padding: EdgeInsets.all(5),
              child: FormBuilderTextField(
                name: "ingridients",
                initialValue: recipe.ingridients,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 4,
                decoration: InputDecoration(
                  hintText: "Ingridents",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: FormBuilderValidators.required(),
              ),
              ),
              Container(
              padding: EdgeInsets.all(5),
              child: FormBuilderTextField(
                name: "steps",
                initialValue: recipe.steps,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 4,
                decoration: InputDecoration(
                  hintText: "Steps",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: FormBuilderValidators.required(),
              ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => saveRecipe(),
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
