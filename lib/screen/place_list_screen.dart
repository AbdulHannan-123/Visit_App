import 'package:advantureing_app/screen/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [IconButton(onPressed: () {
          Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
        }, icon: const Icon(Icons.add))],
      ),
      body:const Column(
        children:[ CircularProgressIndicator()],
      ),
    );
  }
}
