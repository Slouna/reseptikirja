import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/main.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/widgets/main_page.dart';

class NewRecipeScreen extends StatelessWidget {
  final recipeController = Get.find<RecipeController>();
  static final _formKey = GlobalKey<FormBuilderState>();

  _submit() {
    if (_formKey.currentState!.saveAndValidate()) {
      Recipe recipe = Recipe(
        _formKey.currentState!.value['name'],
        _formKey.currentState!.value["description"],
        _formKey.currentState!.value["ingridients"],
        _formKey.currentState!.value["steps"],
        _formKey.currentState!.value["vegan"],
        _formKey.currentState!.value["vegetarian"],
        _formKey.currentState!.value["glutenFree"],
      );

      recipeController.add(recipe);
      _formKey.currentState?.reset();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      child: FormBuilder(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: FormBuilderTextField(
                name: "name",
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

            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: FormBuilderCheckbox(
                      name: "vegan",
                      title: Text("Vegan"),
                    ),
                  ),
                  Expanded(
                    child: FormBuilderCheckbox(
                      name: "vegetarian",
                      title: Text("Vegetarian"),
                    ),
                  ),
                  Expanded(
                    child: FormBuilderCheckbox(
                      name: "glutenFree",
                      title: Text("Gluten Free"),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(onPressed: _submit, child: Text("Save Recipe")),
          ],
        ),
      ),
    );
  }
}
