import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:reseptikirja/screens/main_page.dart';
import 'package:reseptikirja/screens/recipe_list_view.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:reseptikirja/screens/recipe_screen.dart';
import 'package:provider/provider.dart';
import 'package:reseptikirja/providers/favorites_provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
  await Hive.openBox("favorites");
  Get.lazyPut<RecipeController>(() => RecipeController());
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: GetMaterialApp(
        title: 'Recipes App',
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => MainPage()),
          GetPage(
            name: '/recipe/:id',
            page: () {
              final id = Get.parameters['id']!;
              return RecipeScreen(recipeId: id);
            },
          ),
        ],
      ),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: RecipeListView(favorites: false),
    );
  }
}
