import 'package:flutter_test/flutter_test.dart';
import 'package:geo_sort/geo_sort.dart';

void main() {
  group('GeoSort', () {
    test('sortByLatLong sorts items by distance in ascending order', () {
      final List<TestLocation> locations = [
        TestLocation(
            id: 1, city: 'Rome', latitude: 41.9028, longitude: 12.4964),
        TestLocation(
            id: 2, city: 'Milan', latitude: 45.4642, longitude: 9.1900),
        TestLocation(
            id: 3, city: 'Naples', latitude: 40.8518, longitude: 14.2681),
      ];

      final sortedLocations = GeoSort.sortByLatLong(
        items: locations,
        latitude: 41.9028,
        longitude: 12.4964,
      );

      expect(sortedLocations.map((loc) => loc.city),
          orderedEquals(['Rome', 'Naples', 'Milan']));
    });

    test('sortByLatLong sorts items by distance in descending order', () {
      final List<TestLocation> locations = [
        TestLocation(
            id: 1, city: 'Rome', latitude: 41.9028, longitude: 12.4964),
        TestLocation(
            id: 2, city: 'Milan', latitude: 45.4642, longitude: 9.1900),
        TestLocation(
            id: 3, city: 'Naples', latitude: 40.8518, longitude: 14.2681),
      ];

      final sortedLocations = GeoSort.sortByLatLong(
        items: locations,
        latitude: 41.9028,
        longitude: 12.4964,
        ascending: false,
      );

      expect(sortedLocations.map((loc) => loc.city),
          orderedEquals(['Milan', 'Naples', 'Rome']));
    });
  });
}

class TestLocation implements HasLocation {
  final int id;
  final String city;
  @override
  final double latitude;
  @override
  final double longitude;

  TestLocation(
      {required this.id,
      required this.city,
      required this.latitude,
      required this.longitude});

  double? getLatitude() => latitude;
  double? getLongitude() => longitude;
}
