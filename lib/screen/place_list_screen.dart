import 'package:advantureing_app/provider/great_places.dart';
import 'package:advantureing_app/screen/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fatchAndSetPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: const Center(
                      child: Text('Start Adding Something'),
                    ),
                    builder: (ctx, greatplaces, ch) => greatplaces.items.isEmpty
                        ? ch!
                        : ListView.builder(
                            itemCount: greatplaces.items.length,
                            itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatplaces.items[index].image),
                              ),
                              title: Text(greatplaces.items[index].title),
                              onTap: () {
                                // Go to details page
                              },
                            ),
                          ),
                  ),
      ),
    );
  }
}
