import 'package:flutter/material.dart';
import 'package:recipebook/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  RecipeCard({this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {print("Click on card");},
      child: Card(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image.file(
              //   recipe.image,
              //   fit: BoxFit.fitWidth,
              //   height: 100,
              // ),
              Image(
                image: recipe.image == null ? AssetImage('assets/default_food_image.png') : FileImage(recipe.image),
                // image: AssetImage('assets/default_food_image.png'),
                fit: BoxFit.fitWidth,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  recipe.title,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8.0),
                child: Text(
                  recipe.ingredients,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[800]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
