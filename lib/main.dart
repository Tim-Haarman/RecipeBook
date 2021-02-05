import 'package:flutter/material.dart';
import 'package:recipebook/pages/add_recipe.dart';
import 'package:recipebook/pages/home.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/add_recipe': (context) => AddRecipe(),
    },
    theme: ThemeData(
      primaryColor: Colors.lightGreen[700],
      accentColor: Colors.lightGreen[500]
    ),
  ),
  );
}