# geo_sort

A Flutter package for sorting a list of geographic locations based on their distance from a reference point.

Supports both **Haversine** (fast, < 0.3% error) and **Vincenty** (accurate to 0.5 mm on WGS-84) distance algorithms via [latlong2](https://pub.dev/packages/latlong2).

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  geo_sort: ^0.2.0
```

Then run:

```sh
flutter pub get
```

## Usage

### 1. Implement `HasLocation`

Any model class needs to implement the `HasLocation` interface by exposing `latitude` and `longitude`:

```dart
import 'package:geo_sort/geo_sort.dart';

class City implements HasLocation {
  final String name;
  @override
  final double? latitude;
  @override
  final double? longitude;

  City({required this.name, required this.latitude, required this.longitude});
}
```

### 2. Sort by distance

```dart
final cities = [
  City(name: 'Rome',   latitude: 41.9028, longitude: 12.4964),
  City(name: 'Milan',  latitude: 45.4642, longitude: 9.1900),
  City(name: 'Naples', latitude: 40.8518, longitude: 14.2681),
];

final sorted = GeoSort.sortByLatLong(
  items: cities,
  latitude: 41.9028,   // reference point
  longitude: 12.4964,
);
// → [Rome, Naples, Milan]
```

## Parameters

| Parameter   | Type                    | Default                        | Description |
|-------------|-------------------------|--------------------------------|-------------|
| `items`     | `List<T>`               | required                       | List of items to sort |
| `latitude`  | `double`                | required                       | Reference latitude |
| `longitude` | `double`                | required                       | Reference longitude |
| `ascending` | `bool`                  | `true`                         | Sort direction |
| `maxDistance` | `double?`             | `null`                         | Max distance in km; items beyond this are excluded |
| `maxElements` | `int?`                | `null`                         | Max number of items to return |
| `algorithm` | `GeoDistanceAlgorithm`  | `.haversine`                   | Distance formula to use |

## Distance algorithms

```dart
// Haversine — default, faster
GeoSort.sortByLatLong(
  items: cities,
  latitude: 41.9028,
  longitude: 12.4964,
);

// Vincenty — more precise (accurate to ~0.5 mm on WGS-84 ellipsoid)
GeoSort.sortByLatLong(
  items: cities,
  latitude: 41.9028,
  longitude: 12.4964,
  algorithm: GeoDistanceAlgorithm.vincenty,
);
```

## Advanced example

```dart
final nearby = GeoSort.sortByLatLong<City>(
  items: cities,
  latitude: 41.9028,
  longitude: 12.4964,
  ascending: true,
  maxDistance: 300,   // only cities within 300 km
  maxElements: 5,     // return at most 5 results
  algorithm: GeoDistanceAlgorithm.vincenty,
);
```

## Contributing

Issues and pull requests are welcome at [github.com/mariorefetto/geo_sort](https://github.com/mariorefetto/geo_sort).

## License

geo_sort is available under the MIT license. See the [LICENSE](LICENSE) file for details.
