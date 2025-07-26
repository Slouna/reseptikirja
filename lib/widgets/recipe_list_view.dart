import 'package:flutter/material.dart';
import 'package:reseptikirja/widgets/recipe_card.dart';

class RecipeListView extends StatelessWidget {
  const RecipeListView({super.key, this.userID});

  final userID;
  @override
  Widget build(BuildContext context) {
    return userID == 0
        ? Center(
            child: Column(children: [RecipeCard(), RecipeCard(), RecipeCard()]),
          )
        : Center(child: Column(children: [RecipeCard()]));
  }
}
