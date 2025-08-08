import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/main.dart';
import 'package:reseptikirja/screens/favourites_screen.dart';
import 'package:reseptikirja/screens/new_recipe_screen.dart';
import '../utils/custom_search_delegate.dart';

/* 
   TODO: make single recipe cite nicer
   TODO: delete recipes
   TODO: clean imports


*/

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final List<Widget> _pages;

  int _selectedIndex = 0;
  final recipeController = Get.find<RecipeController>();
  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(),
      FavouritesScreen(),
      NewRecipeScreen(onRecipeSaved: changeScreen),
    ];
  }

  void printRecipes() {
    for (var i in recipeController.recipes) {
      print(i.name);
      print(i.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 185, 185),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 211, 179, 217),
        title: Text("Recipes"),
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: CustomSearchDelegate()),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: LayoutBuilder(
      builder: (context, constraints) {
        return Row(
              children: [
                if (isDesktop)
                  NavigationRail(
                    backgroundColor: Color.fromARGB(255, 211, 179, 217),
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: changeScreen,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text("Home"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text("Favorites"),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add),
                        label: Text("New"),
                      ),
                    ],
                  ),
                Expanded(
                  child: Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 1200),
                      child: _pages[_selectedIndex]
                    ),
                  ),
                ),
              ],
              );
      },
      ),
            bottomNavigationBar: !isDesktop
          ? BottomNavigationBar(
              backgroundColor: Color.fromARGB(255, 211, 179, 217),
              currentIndex: _selectedIndex,
              onTap: changeScreen,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favorites",
                ),
                BottomNavigationBarItem(icon: Icon(Icons.add), label: "New"),
              ],
            )
          : null,
              
    );
  }
}
