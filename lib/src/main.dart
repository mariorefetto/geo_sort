import 'package:geo_sort/src/extensions/extensions.dart';
import 'package:latlong2/latlong.dart';

/// Selects the algorithm used to compute distances between two coordinates.
///
/// - [haversine]: faster, suitable for most use cases (error < 0.3%).
/// - [vincenty]: slower but accurate to within 0.5 mm on the WGS-84 ellipsoid.
enum GeoDistanceAlgorithm { haversine, vincenty }

/// A utility class for sorting a list of items by their distance from a reference location.
class GeoSort {
  static const _haversine = Distance();
  static const _vincenty = DistanceVincenty();

  /// Sorts the list of items by their distance from the reference location.
  ///
  /// The [items] parameter is the list of items to be sorted.
  /// The [latitude] and [longitude] parameters specify the coordinates of the reference location.
  /// The [ascending] parameter indicates whether to sort the items in ascending order (default) or descending order.
  /// The [maxDistance] parameter specifies the maximum distance in km allowed for items to be included.
  /// The [maxElements] parameter specifies the maximum number of elements to return.
  /// The [algorithm] selects the distance formula: [GeoDistanceAlgorithm.haversine] (default, faster)
  /// or [GeoDistanceAlgorithm.vincenty] (more precise).
  ///
  /// Returns a sorted list of items.
  static List<T> sortByLatLong<T extends HasLocation>({
    required List<T> items,
    required double latitude,
    required double longitude,
    bool ascending = true,
    double? maxDistance,
    int? maxElements,
    GeoDistanceAlgorithm algorithm = GeoDistanceAlgorithm.haversine,
  }) {
    final Distance calc =
        algorithm == GeoDistanceAlgorithm.vincenty ? _vincenty : _haversine;
    final ref = LatLng(latitude, longitude);
    final List<MapEntry<double, T>> distanceItemList = [];

    for (final item in items) {
      final lat = item.latitude;
      final long = item.longitude;

      if (lat == null || long == null) continue;

      final distanceKm = calc.as(
        LengthUnit.Kilometer,
        ref,
        LatLng(lat, long),
      );
      if (maxDistance != null && distanceKm > maxDistance) continue;
      distanceItemList.add(MapEntry(distanceKm, item));
    }

    distanceItemList.sort(
      (a, b) => ascending ? a.key.compareTo(b.key) : b.key.compareTo(a.key),
    );

    if (maxElements != null && maxElements < distanceItemList.length) {
      distanceItemList.length = maxElements;
    }

    return distanceItemList.map((e) => e.value).toList();
  }
}
