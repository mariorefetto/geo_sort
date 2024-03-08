# Geosort

Geosort is a Dart package for sorting a list of geographic 
locations based on their distance from a reference location.
It provides functions for calculating the distance between two 
geographic coordinates using the inverse haversine formula, as
well as for sorting a list of locations by distance. 
Geosort is useful for applications that require the computation 
and sorting of geographic locations, such as mapping, 
geolocation, and points of interest management.


### Installation

This package is intended to support development of Dart projects. In
general, put it under
[dependencies](https://dart.dev/tools/pub/dependencies),
in your [pubspec.yaml](https://dart.dev/tools/pub/pubspec):

```yaml
dependencies:
  geosort: ^0.0.1
```

You can install packages from the command line:

```terminal
pub get
```

## Usage

Here's an example of how to use Geosort:

```dart
import 'package:geosort/geosort.dart';

void main() {
  // List of locations
  List<Map<String, dynamic>> locations = [
    {'name': 'Location A', 'lat': 1.0, 'long': 1.0},
    {'name': 'Location B', 'lat': 2.0, 'long': 2.0},
    {'name': 'Location C', 'lat': 3.0, 'long': 3.0},
  ];

  // Reference coordinates
  double referenceLat = 0.0;
  double referenceLong = 0.0;

  // Sort the list by distance
  List<Map<String, dynamic>> sortedLocations =
      sortByLatLong(locations, referenceLat, referenceLong);

  // Print sorted list
  print(sortedLocations);
}
```

## Contributing
Contributions to Geosort are welcome! Please feel free to 
submit issues for any bugs or feature requests, and pull requests are encouraged.

## License
GeoSort is available under the MIT license. See the LICENSE
file for more info.
