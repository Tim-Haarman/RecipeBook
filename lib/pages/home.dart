import 'package:flutter/material.dart';
import 'package:recipebook/recipe.dart';
import 'package:recipebook/recipe_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // List<Recipe> recipes = [
  //   Recipe(title: "First recipe", ingredients: "Something", image: "https://hips.hearstapps.com/delish/assets/17/36/1504715566-delish-fettuccine-alfredo.jpg"),
  //   Recipe(title: "Second food", ingredients: "Something else", image: "https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/chicken_enchiladas_02595_16x9.jpg"),
  //   Recipe(title: "First recipe", ingredients: "Something", image: "https://hips.hearstapps.com/delish/assets/17/36/1504715566-delish-fettuccine-alfredo.jpg"),
  //   Recipe(title: "Second food", ingredients: "Something else", image: "https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/chicken_enchiladas_02595_16x9.jpg"),
  // ];

  List<Recipe> recipes = [
    Recipe(title: "First recipe", ingredients: "Something", image: null),
    Recipe(title: "Second food", ingredients: "Something else", image: null),
  ];

  // String encoded = jsonEncode(Recipe(title: "First recipe", ingredients: "Something", image: "https://hips.hearstapps.com/delish/assets/17/36/1504715566-delish-fettuccine-alfredo.jpg"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wat gaan we nu weer eten?"),
          centerTitle: true,
          backgroundColor: Colors.lightGreen[700],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            dynamic result = await Navigator.pushNamed(context, '/add_recipe');
            if(result != null){
              setState(() {
                recipes.add(Recipe(
                 title: result["title"],
                 ingredients: result["ingredients"],
                 image: result["image"]
                ));
              });
            }
          },
          child: Icon(Icons.add),
          foregroundColor: Colors.white,
        ),
      // body: Text(encoded),
        body: ListView(
          children: recipes.map((recipe) => RecipeCard(recipe: recipe)).toList(),
        )
    );
  }
}
