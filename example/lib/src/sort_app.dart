import 'package:example/src/location_list_screen.dart';
import 'package:flutter/material.dart';

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
