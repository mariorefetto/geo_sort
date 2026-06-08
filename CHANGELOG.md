## 0.2.0

+ Added `latlong2` as dependency, replacing the internal Haversine implementation.
+ Added `GeoDistanceAlgorithm` enum to choose the distance formula per call.
+ Added support for **Vincenty** algorithm (accurate to ~0.5 mm on WGS-84 ellipsoid) via `GeoDistanceAlgorithm.vincenty`.
+ **Haversine** remains the default (`GeoDistanceAlgorithm.haversine`), powered by `latlong2`.

* Updated minimum Flutter version to `>=3.27.0`.
* Updated `flutter_lints` to `^6.0.0`.
* Updated `cupertino_icons` to `^1.0.8` in example.
* Updated README with algorithm selection docs and parameter table.

- Removed internal `utils.dart` and custom Haversine formula (replaced by `latlong2`).
- Removed `GeoSort.getDoublePropertyValue` — `sortByLatLong` now accesses `HasLocation` properties directly.

* Fixed deprecated `ThemeData.primarySwatch` in example (now uses `ColorScheme.fromSeed`).
* Fixed potential `FormatException` crash in example when coordinate fields contain invalid input (`double.tryParse` with fallback).

## 0.1.0

+ Added support for sorting locations by distance from a reference location.
+ Added `GeoSort` utility class.
+ Added `sortByLatLong` method to `GeoSort` class.
+ Added `TestLocation` class implementing `HasLocation` interface for testing purposes.
+ Added tests for `GeoSort` class.

* Updated documentation to include instructions on how to use the `GeoSort` utility class.
* Updated documentation with explanations of parameters and usage examples.
* Updated `GeoSort.sortByLatLong` method to accept generic type that extends `HasLocation`.

* Fixed a bug in the calculation of distances in `GeoSort.sortByLatLong` method.

## 0.0.3

* Add Example files.

## 0.0.2

* First Release.

## 0.0.1

* TODO: Describe initial release.
