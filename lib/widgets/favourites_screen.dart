import 'package:flutter/material.dart';
import 'package:reseptikirja/widgets/recipe_list_view.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return   Center(child: Center(
      child: RecipeListView(favourites: true,),),
      
    );
  }
}
