import 'package:example/src/model/location.dart';
import 'package:flutter/material.dart';
import 'package:geo_sort/geo_sort.dart';

class LocationListScreen extends StatefulWidget {
  const LocationListScreen({super.key});

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  List<Location> _italianLocations = [
    Location(id: 1, name: 'Roma', city: 'Rome', lat: 41.9028, long: 12.4964),
    Location(id: 2, name: 'Milano', city: 'Milan', lat: 45.4642, long: 9.1900),
    Location(id: 3, name: 'Napoli', city: 'Naples', lat: 40.8518, long: 14.2681),
    Location(id: 4, name: 'Torino', city: 'Turin', lat: 45.0703, long: 7.6869),
    Location(id: 5, name: 'Palermo', city: 'Palermo', lat: 38.1157, long: 13.3615),
    Location(id: 6, name: 'Genova', city: 'Genoa', lat: 44.4056, long: 8.9463),
    Location(id: 7, name: 'Bologna', city: 'Bologna', lat: 44.4949, long: 11.3426),
    Location(id: 8, name: 'Firenze', city: 'Florence', lat: 43.7696, long: 11.2558),
    Location(id: 9, name: 'Bari', city: 'Bari', lat: 41.1171, long: 16.8719),
    Location(id: 10, name: 'Catania', city: 'Catania', lat: 37.5079, long: 15.0830),
    Location(id: 11, name: 'Venezia', city: 'Venice', lat: 45.4408, long: 12.3155),
    Location(id: 12, name: 'Verona', city: 'Verona', lat: 45.4384, long: 10.9916),
    Location(id: 13, name: 'Messina', city: 'Messina', lat: 38.1938, long: 15.5540),
    Location(id: 14, name: 'Padova', city: 'Padua', lat: 45.4064, long: 11.8768),
    Location(id: 15, name: 'Trieste', city: 'Trieste', lat: 45.6495, long: 13.7768),
    Location(id: 16, name: 'Taranto', city: 'Taranto', lat: 40.4786, long: 17.2394),
    Location(id: 17, name: 'Brescia', city: 'Brescia', lat: 45.5398, long: 10.2227),
    Location(
        id: 18, name: 'Reggio di Calabria', city: 'Reggio Calabria', lat: 38.1147, long: 15.6500),
    Location(id: 19, name: 'Modena', city: 'Modena', lat: 44.6471, long: 10.9252),
    Location(id: 20, name: 'Prato', city: 'Prato', lat: 43.8777, long: 11.1027),
  ];

  final TextEditingController _latitudeController = TextEditingController(text: '41.9028');
  final TextEditingController _longitudeController = TextEditingController(text: '12.4964');

  bool _ascending = true;
  void _sortLocations(bool ascending) {
    final latitude =
        _latitudeController.text.isNotEmpty ? double.parse(_latitudeController.text) : 41.9028;
    final longitude =
        _longitudeController.text.isNotEmpty ? double.parse(_longitudeController.text) : 12.4964;

    setState(() {
      _ascending = ascending;
      _italianLocations = GeoSort.sortByLatLong<Location>(
        items: _italianLocations,
        latitude: latitude,
        longitude: longitude,
        ascending: _ascending,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location List'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _italianLocations.length,
                itemBuilder: (context, index) {
                  final location = _italianLocations[index];
                  return ListTile(
                    title: Text(location.name),
                    subtitle: Text(location.city),
                    // Aggiungere altre informazioni se necessario
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _sortLocations(true),
                    child: const Text('Ordina Ascendente'),
                  ),
                  ElevatedButton(
                    onPressed: () => _sortLocations(false),
                    child: const Text('Ordina Discendente'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _latitudeController,
                      decoration: const InputDecoration(labelText: 'Latitude'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      controller: _longitudeController,
                      decoration: const InputDecoration(labelText: 'Longitude'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Gestire l'aggiunta di una nuova posizione con le coordinate inserite
              },
              child: const Text('Aggiungi Posizione'),
            ),
          ],
        ),
      ),
    );
  }
}
