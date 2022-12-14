import 'package:advantureing_app/provider/great_places.dart';
import 'package:advantureing_app/screen/add_place_screen.dart';
import 'package:advantureing_app/screen/place_detail_screen.dart';
import 'package:advantureing_app/screen/place_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
                  primary:const Color(0xff1c3f39),
                  secondary: const Color(0xffe9e6d7),
                ),
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName:(context) => AddPlaceScreen(),
          PlaceDetailScreen.routeName:(context) => PlaceDetailScreen()
        },
      ),
    );
  }
}
