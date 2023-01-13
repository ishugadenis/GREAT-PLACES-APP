import 'package:flutter/material.dart';
import '../providers/greate_places.dart';
import 'package:greate_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('You places'), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeNmae);
            },
            icon: const Icon(Icons.add))
      ]),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    child: const Center(
                        child: Text('Got no places yet, start adding some!')),
                    builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
                        ? ch!
                        : ListView.builder(
                            itemCount: greatPlaces.items.length,
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(greatPlaces.items[i].image)),
                              title: Text(greatPlaces.items[i].title),
                            ),
                          ),
                  ),
      ),
    );
  }
}
