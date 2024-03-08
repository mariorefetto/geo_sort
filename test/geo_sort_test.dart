import 'package:flutter_test/flutter_test.dart';
import 'package:geo_sort/geo_sort.dart';

void main() {
  group('Geosort Tests', () {
    test('Test di ordinamento ascendente', () {
      // Lista di posizioni non ordinata
      List<Map<String, dynamic>> locations = [
        {'name': 'Location A', 'lat': 1.0, 'long': 1.0},
        {'name': 'Location B', 'lat': 2.0, 'long': 2.0},
        {'name': 'Location C', 'lat': 3.0, 'long': 3.0},
      ];

      // Coordinate di riferimento
      final Coordinates coordinates = Coordinates(0.0, 0.0);

      // Ordina la lista
      List<Map<String, dynamic>> sortedLocations = sortByCoordinate(locations, coordinates);

      // Verifica se la lista è ordinata correttamente
      expect(sortedLocations[0]['name'], 'Location A');
      expect(sortedLocations[1]['name'], 'Location B');
      expect(sortedLocations[2]['name'], 'Location C');
    });

    test('Test di ordinamento discendente', () {
      // Lista di posizioni non ordinata
      List<Map<String, dynamic>> locations = [
        {'name': 'Location A', 'lat': 1.0, 'long': 1.0},
        {'name': 'Location B', 'lat': 2.0, 'long': 2.0},
        {'name': 'Location C', 'lat': 3.0, 'long': 3.0},
      ];

      // Coordinate di riferimento
      final Coordinates coordinates = Coordinates(0.0, 0.0);

      // Ordina la lista in ordine discendente
      List<Map<String, dynamic>> sortedLocations =
          sortByCoordinate(locations, coordinates, ascending: false);

      // Verifica se la lista è ordinata correttamente
      expect(sortedLocations[0]['name'], 'Location C');
      expect(sortedLocations[1]['name'], 'Location B');
      expect(sortedLocations[2]['name'], 'Location A');
    });
  });
}
