import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reseptikirja/controllers/recipe_controller.dart';
import 'package:reseptikirja/models/recipe.dart';
import 'package:reseptikirja/widgets/main_page.dart';
import 'package:reseptikirja/widgets/favourites_screen.dart';
import 'package:reseptikirja/widgets/recipe_card.dart';
import 'package:reseptikirja/widgets/recipe_list_view.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:reseptikirja/widgets/recipe_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
  Get.lazyPut<RecipeController>(() => RecipeController());
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: GetMaterialApp(
        title: 'Recipes App',
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => MainPage()),
          GetPage(name: '/recipe', page: () => RecipeScreen()),
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
      child: RecipeListView(favourites: false),
    );
  }
}
