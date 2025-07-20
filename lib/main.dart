import 'package:flutter/material.dart';
import 'package:reseptikirja/widgets/bottom_navi_bar.dart';
import 'package:reseptikirja/widgets/recipe_card.dart';
import 'package:reseptikirja/widgets/recipe_list_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: RecipeListView(),
        ),
        bottomNavigationBar: BottomNaviBar( 
              onDestinationSelected: null
      ),
    ));
  }
}
