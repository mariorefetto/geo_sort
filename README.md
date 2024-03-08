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
  geo_sort: ^0.0.2
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
      GeoSort.sortByLatLong(locations: locations, latitude: referenceLat, longitude: referenceLong);


  // Print sorted list
  print(sortedLocations);
}
```

# Explanation of Parameters

ascending: true means that the sorted list will be in ascending 
order based on the distance from the reference location. If set to
false, the list will be sorted in descending order.

maxDistance: 500 defines the maximum distance (in kilometers) within 
which items will be included in the sorted list. Items beyond this 
distance will be excluded from the list.

maxElements: 5 specifies the maximum number of elements to include
in the sorted list. If the total number of available elements is 
greater than maxElements, only the first maxElements elements will 
be included in the sorted list.

These parameters provide additional control over the selection and 
sorting of items in the list based on user preferences or specific 
application requirements.

## Contributing
Contributions to Geosort are welcome! Please feel free to 
submit issues for any bugs or feature requests, and pull requests are encouraged.

## License
GeoSort is available under the MIT license. See the LICENSE
file for more info.
