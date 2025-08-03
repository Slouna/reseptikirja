import 'package:flutter/material.dart';
import 'package:reseptikirja/main.dart';
import 'package:reseptikirja/widgets/favourites_screen.dart';
import 'package:reseptikirja/widgets/new_recipe_screen.dart';
import 'custom_search_delegate.dart';

/* 
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
  late final List<Widget> _pages;

  int _selectedIndex = 0;

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

  

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 600;

    

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 106, 102, 102),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 162, 162, 157),
        title: Text("Recipes"),
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: CustomSearchDelegate()),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              backgroundColor: Color.fromARGB(255, 162, 162, 157),
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
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: !isDesktop
          ? BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 162, 162, 157),
              currentIndex: _selectedIndex,
              onTap: changeScreen,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home"
                  ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorites",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: "New"
                ),
              ],
            )
          : null,
    );
  }
}
