import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/widgets/bottom_navi_bar.dart';
import 'package:reseptikirja/widgets/recipe_list_view.dart';

class FavouritesScreen extends StatelessWidget {
  int favourites = 0;
  @override
  Widget build(BuildContext context) {
    return  favourites > 0 
    ? Center(
      child: RecipeListView(userID: 3,),
    ) 
    : Center(
      child: (Text("You haven't added any favourites yet")),
    );
  }
}
