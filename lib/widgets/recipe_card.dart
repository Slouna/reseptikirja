import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/widgets/recipe_screen.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});
  final Recipe recipe;

  String getName() {
    return recipe.name!;
  }

  Widget readMore() {
    return Center(child: Column(children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              "Ingridients",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(recipe.ingridients!),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text("Steps", style: TextStyle(fontStyle: FontStyle.italic)),
          ),
          Container(padding: EdgeInsets.all(5), child: Text(recipe.steps!)),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [IconButton(onPressed: null, icon: Icon(Icons.favorite_border, color: Colors.red[300]), tooltip: "Add to favourites",),
          IconButton(onPressed: () => Get.toNamed("/recipe/${recipe.name}"), icon: Icon(Icons.edit), tooltip: "Edit recipe",),
          ])
    ],));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpandablePanel(
        header: Container(padding: EdgeInsets.all(5), child: Center(child: Text(recipe.name!, style: TextStyle(fontSize: 16)))),
        collapsed: Container(padding: EdgeInsets.all(10), child: Text(recipe.description!)),
        expanded: readMore()
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/widgets/recipe_screen.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});
  final Recipe recipe;

  String getName() {
    return recipe.name!;
  }

  readMore() {
    Get.toNamed(("recipe/ragu"));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.local_pizza_outlined),
            title: Text(recipe.name!),
            subtitle: Text(recipe.description!),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: readMore, child: Text("Read more")),
              IconButton(onPressed: null, icon: Icon(Icons.favorite_border)),
            ],
          ),
        ],
      ),
    );
  }
}

 
  */