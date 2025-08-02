import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/main.dart';
import 'package:reseptikirja/widgets/favourites_screen.dart';
import 'package:reseptikirja/widgets/new_recipe_screen.dart';
import 'package:reseptikirja/widgets/recipe_screen.dart';
import 'custom_search_delegate.dart';
import 'package:reseptikirja/models/recipe.dart';

/* 
   TODO: change view on different screen sizes
   TODO: make single recipe cite nicer
   TODO: edit and delete reipes
   TODO: clean imports


*/

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Widget> pages;

  int _selectedIndex = 0;

  void changeScreen(int n) {
    setState(() {
      _selectedIndex = n;
    });
  }

  @override
  void initState() {
    super.initState();
    pages = [
      HomeScreen(),
      FavouritesScreen(),
      NewRecipeScreen(onRecipeSaved: changeScreen),
      RecipeScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
        actions: <Widget>[
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: CustomSearchDelegate()),
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: (const Color.fromARGB(255, 239, 237, 237)),
      ),
      body: pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add New'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
