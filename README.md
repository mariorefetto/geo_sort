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
  geo_sort: ^0.1.0
```

You can install packages from the command line:

```terminal
pub get
```

## Usage

First, you need to create a class that implements the HasLocation 
interface, like this:

```dart
class TestLocation implements HasLocation {
  final int id;
  final String city;
  @override
  final double latitude;
  @override
  final double longitude;

  TestLocation({
    required this.id,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

}
```
Then, create a list of TestLocation objects:

```dart
final List<TestLocation> locations = [
  TestLocation(id: 1, city: 'Rome', latitude: 41.9028, longitude: 12.4964),
  TestLocation(id: 2, city: 'Milan', latitude: 45.4642, longitude: 9.1900),
  TestLocation(id: 3, city: 'Naples', latitude: 40.8518, longitude: 14.2681),
];
```

Now, you can use the GeoSort class to sort the list of locations by 
distance from a reference location. Here's how:


```dart
final sortedLocations = GeoSort.sortByLatLong(
  items: locations,
  latitude: 41.9028,
  longitude: 12.4964,
  ascending: false,
);
```

This will sort the locations list by distance from the coordinates (41.9028, 12.4964) in descending order.

# Explanation of Parameters

items: The list of locations to be sorted.

latitude and longitude: The coordinates of the reference location.

ascending: Indicates whether to sort the items in ascending order (default) or descending order.

maxDistance: Defines the maximum distance (in kilometers) within which items
will be included in the sorted list. 

maxElements: Specifies the maximum number of elements to include in the sorted list. 

These parameters provide additional control over the selection and sorting of
items in the list based on user preferences or specific application requirements.

# Full Code

```dart
import 'package:geo_sort/src/extensions/extensions.dart';
import 'package:geo_sort/src/utils/utils.dart';

class TestLocation implements HasLocation {
  final int id;
  final String city;
  @override
  final double latitude;
  @override
  final double longitude;

  TestLocation({
    required this.id,
    required this.city,
    required this.latitude,
    required this.longitude,
  });
}

void main() {
  // Create a list of TestLocation instances
  final List<TestLocation> locations = [
    TestLocation(id: 1, city: 'Rome', latitude: 41.9028, longitude: 12.4964),
    TestLocation(id: 2, city: 'Milan', latitude: 45.4642, longitude: 9.1900),
    TestLocation(id: 3, city: 'Naples', latitude: 40.8518, longitude: 14.2681),
  ];

  // Reference coordinates
  final double referenceLat = 41.9028;
  final double referenceLong = 12.4964;

  // Sort the list by distance
  final sortedLocations = GeoSort.sortByLatLong<TestLocation>(
    items: locations,
    latitude: referenceLat,
    longitude: referenceLong,
    ascending: false,
  );

  // Print sorted list
  print('Sorted Locations:');
  sortedLocations.forEach((location) {
    print('${location.city}: ${location.latitude}, ${location.longitude}');
  });
}
```

## Contributing
Contributions to Geosort are welcome! Please feel free to 
submit issues for any bugs or feature requests, and pull requests are encouraged.

## License
GeoSort is available under the MIT license. See the LICENSE
file for more info.
