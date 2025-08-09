
import 'package:flutter/material.dart';
import 'package:reseptikirja/screens/recipe_list_view.dart';

class HomeScreen extends  StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RecipeListView(favorites: false),
    );
  }
}
