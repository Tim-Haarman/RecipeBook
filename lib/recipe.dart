import 'dart:io';

class Recipe {
  String title;
  String ingredients;
  File image;

  Recipe({this.title, this.ingredients, this.image});

  // Recipe(String title, String ingredients, File image){
  //   this.title = title;
  //   this.ingredients = ingredients;
  //
  //   if(image == null){
  //     this.image = getImageFileFromAssets('assets/default_food_image.png');
  //   } else {
  //     this.image = image;
  //   }
  //
  // }



  // Recipe.fromJson(Map<String, dynamic> json)
  //     : title = json['title'],
  //       ingredients = json['ingredients'],
  //       image = json['image'];
  //
  // Map<String, dynamic> toJson() => {
  //   'title' : title,
  //   'ingredients' : ingredients,
  //   'image' : image,
  // };

}