import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/widgets/main_page.dart';
import 'package:reseptikirja/widgets/favourites_screen.dart';
import 'package:reseptikirja/widgets/recipe_card.dart';
import 'package:reseptikirja/widgets/recipe_list_view.dart';

void main() {
  runApp(GetMaterialApp(home: MainPage()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(padding: EdgeInsets.all(10) ,child: const RecipeListView(userID: 0),
        
    );
  }
}
