import 'dart:convert';

/// An example application demonstrating the usage of GeoSort
/// to sort a list of locations by their distance from a reference location.
import 'package:flutter/material.dart';
import 'package:geo_sort/geo_sort.dart';

void main() {
  runApp(const SortApp());
}

class SortApp extends StatelessWidget {
  const SortApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location List Order with GeoSort',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LocationListScreen(),
    );
  }
}

class LocationListScreen extends StatefulWidget {
  const LocationListScreen({super.key});

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  // List of Italian locations with their latitude and longitude
  List<Location> _italianLocations = [
    Location(
        id: 1,
        name: 'Roma',
        city: 'Rome',
        latitude: 41.9028,
        longitude: 12.4964),
    Location(
        id: 2,
        name: 'Milano',
        city: 'Milan',
        latitude: 45.4642,
        longitude: 9.1900),
    Location(
        id: 3,
        name: 'Napoli',
        city: 'Naples',
        latitude: 40.8518,
        longitude: 14.2681),
    Location(
        id: 4,
        name: 'Torino',
        city: 'Turin',
        latitude: 45.0703,
        longitude: 7.6869),
    Location(
        id: 5,
        name: 'Palermo',
        city: 'Palermo',
        latitude: 38.1157,
        longitude: 13.3615),
    Location(
        id: 6,
        name: 'Genova',
        city: 'Genoa',
        latitude: 44.4056,
        longitude: 8.9463),
    Location(
        id: 7,
        name: 'Bologna',
        city: 'Bologna',
        latitude: 44.4949,
        longitude: 11.3426),
    Location(
        id: 8,
        name: 'Firenze',
        city: 'Florence',
        latitude: 43.7696,
        longitude: 11.2558),
    Location(
        id: 9,
        name: 'Bari',
        city: 'Bari',
        latitude: 41.1171,
        longitude: 16.8719),
    Location(
        id: 10,
        name: 'Catania',
        city: 'Catania',
        latitude: 37.5079,
        longitude: 15.0830),
    Location(
        id: 11,
        name: 'Venezia',
        city: 'Venice',
        latitude: 45.4408,
        longitude: 12.3155),
    Location(
        id: 12,
        name: 'Verona',
        city: 'Verona',
        latitude: 45.4384,
        longitude: 10.9916),
    Location(
        id: 13,
        name: 'Messina',
        city: 'Messina',
        latitude: 38.1938,
        longitude: 15.5540),
    Location(
        id: 14,
        name: 'Padova',
        city: 'Padua',
        latitude: 45.4064,
        longitude: 11.8768),
    Location(
        id: 15,
        name: 'Trieste',
        city: 'Trieste',
        latitude: 45.6495,
        longitude: 13.7768),
    Location(
        id: 16,
        name: 'Taranto',
        city: 'Taranto',
        latitude: 40.4786,
        longitude: 17.2394),
    Location(
        id: 17,
        name: 'Brescia',
        city: 'Brescia',
        latitude: 45.5398,
        longitude: 10.2227),
    Location(
        id: 18,
        name: 'Reggio di Calabria',
        city: 'Reggio Calabria',
        latitude: 38.1147,
        longitude: 15.6500),
    Location(
        id: 19,
        name: 'Modena',
        city: 'Modena',
        latitude: 44.6471,
        longitude: 10.9252),
    Location(
        id: 20,
        name: 'Prato',
        city: 'Prato',
        latitude: 43.8777,
        longitude: 11.1027),
  ];

  final TextEditingController _latitudeController =
      TextEditingController(text: '37.074153');
  final TextEditingController _longitudeController =
      TextEditingController(text: '14.240354');

  bool _ascending = true;
  void _sortLocations(bool ascending) {
    final latitude = _latitudeController.text.isNotEmpty
        ? double.parse(_latitudeController.text)
        : 41.9028;
    final longitude = _longitudeController.text.isNotEmpty
        ? double.parse(_longitudeController.text)
        : 12.4964;

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
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      controller: _longitudeController,
                      decoration: const InputDecoration(labelText: 'Longitude'),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
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

/// Model class representing a location with latitude and longitude.
///
/// This class should implement [HasLocation] interface to ensure
/// it contains latitude and longitude properties.

class Location implements HasLocation {
  final int id;
  final String name;
  final String city;
  @override
  final double latitude;
  @override
  final double longitude;

  Location({
    required this.id,
    required this.name,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      city: map['city'] ?? '',
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Location(id: $id, name: $name, city: $city, latitude: $latitude, longitude: $longitude)';
  }
}
