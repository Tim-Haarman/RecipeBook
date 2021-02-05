import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class AddRecipe extends StatefulWidget {
  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  String _title;
  String _ingredients;
  File _image;
  final picker = ImagePicker();
  // String _image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File localImage = await makeLocalImageCopy(File(pickedFile.path));
      setState(() {
        _image = localImage;
      });
    } else {
      print('No image selected');
    }

    print("Finished with the image");

    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //   } else {
    //     print('No image selected.');
    //   }
    // });
  }

  Future makeLocalImageCopy(File image) async {
    print("Test");
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String fileName = basename(image.path);
    String imgPath = appDocDir.uri.resolve(fileName).path;
    return(await image.copy(imgPath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new recipe"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text("This is a test"),
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(
                  labelText: 'Recipe name'
                ),
                validator: (String value) {
                  if(value.isEmpty){
                    return("Please enter a name");
                  }
                  return(null);
                },
                onSaved: (String value) {
                  _title = value;
                },
              ),
              TextFormField(
                initialValue: _ingredients,
                decoration: const InputDecoration(
                    labelText: 'Ingredients'
                ),
                validator: (String value) {
                  if(value.isEmpty){
                    return("Please list the ingredients");
                  }
                  return(null);
                },
                onSaved: (String value) {
                  _ingredients = value;
                },
              ),
              FlatButton(
                onPressed: () {

                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();

                  Navigator.pop(context, {
                    "title": _title,
                    "ingredients": _ingredients,
                    "image": _image,
                  });
                },
                child: Text("Add recipe"),
              ),
            ],
          ),
        )
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ),
    );
  }
}
