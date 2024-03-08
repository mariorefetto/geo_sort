import 'package:flutter_test/flutter_test.dart';
import 'package:geo_sort/geo_sort.dart';

void main() {
  test('Test sortByLatLong with maxDistance and maxElements', () {
    final items = [
      {'id': '1', 'lat': 37.07395, 'long': 14.217377},
      {'id': '2', 'lat': 37.507877, 'long': 15.08303},
      {'id': '3', 'lat': 38.115688, 'long': 13.361267},
      {'id': '4', 'lat': 38.193813, 'long': 15.554015},
      {'id': '5', 'lat': 37.237589, 'long': 14.51027},
      {'id': '6', 'lat': 38.217058, 'long': 15.239605},
      {'id': '7', 'lat': 41.125547, 'long': 16.866769},
      {'id': '8', 'lat': 37.108379, 'long': 13.947512},
      {'id': '9', 'lat': 41.902783, 'long': 12.496365},
      {'id': '10', 'lat': 45.464203, 'long': 9.189982},
      {'id': '11', 'lat': 45.070312, 'long': 7.686856},
      {'id': '12', 'lat': 37.251057, 'long': 14.295457},
    ];

    final sortedItems = GeoSort.sortByLatLong(
      items: items,
      latitude: 37.07395,
      longitude: 14.217377,
      ascending: true,
      maxDistance: 500,
      maxElements: 5,
    );

    expect(sortedItems.length, equals(5));
  });
}
