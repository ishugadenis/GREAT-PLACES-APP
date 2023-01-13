import 'package:flutter/material.dart';
import 'package:greate_places_app/screens/add_place_screen.dart';
import 'package:greate_places_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import 'providers/greate_places.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
    
        ),
        home:const PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeNmae: (_) => AddPlaceScreen(),
        },
      ),
    );
  }
}

