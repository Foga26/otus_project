import 'package:dz_2/widget/recipe_info_widget/pokeboul_info_widget.dart';
import 'package:dz_2/widget/recipe_info_widget/salmon_info_recipe_widget.dart';
import 'package:dz_2/widget/recipes_list_widget.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: RecipesListWidget(),
      initialRoute: '/recipes',
      routes: {
        '/recipes': (context) => const RecipesListWidget(),
        '/recipeInfo': (context) => SalmonInfoRecipeWidget(),
        '/recipeInfoPokeboul': (context) => PokeboulInfoWidget(),
      },
    );
  }
}
