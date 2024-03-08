import 'package:geo_sort/src/utils/utils.dart';

/// A utility class for sorting a list of items by their distance from a reference location.
class GeoSort {
  /// Sorts the list of items by their distance from the reference location.
  ///
  /// The [items] parameter is the list of items to be sorted.
  /// The [latitude] and [longitude] parameters specify the coordinates of the reference location.
  /// The [ascending] parameter indicates whether to sort the items in ascending order (default) or descending order.
  /// The [maxDistance] parameter specifies the maximum distance allowed for items to be included in the sorted list.
  /// The [maxElements] parameter specifies the maximum number of elements to return in the sorted list.
  ///
  /// Returns a sorted list of items.
  static List<T> sortByLatLong<T>({
    required List<T> items,
    required double latitude,
    required double longitude,
    bool ascending = true,
    double? maxDistance,
    int? maxElements,
  }) {
    final List<MapEntry<double, T>> distanceItemList = [];
    for (var item in items) {
      final lat = _getDoubleValue(item, 'lat');
      final long = _getDoubleValue(item, 'long');

      if (lat == null || long == null) return items;

      double distance = getDistanceFromLatLonInKm(latitude, longitude, lat, long);
      if (maxDistance != null && distance > maxDistance) continue;
      distanceItemList.add(MapEntry(distance, item));
    }

    distanceItemList.sort((a, b) {
      return ascending ? a.key.compareTo(b.key) : b.key.compareTo(a.key);
    });

    if (maxElements != null && maxElements < distanceItemList.length) {
      distanceItemList.length = maxElements;
    }

    return distanceItemList.map((e) => e.value).toList();
  }

  /// Retrieves the double value of a property from an object.
  ///
  /// The [object] parameter is the object from which to retrieve the property value.
  /// The [propertyName] parameter is the name of the property.
  ///
  /// Returns the double value of the property, or null if the property is not found or is not a double.
  static double? _getDoubleValue<T>(T object, String propertyName) {
    final value = object is Map<String, dynamic>
        ? object[propertyName]
        : object is Map<String, Object?>
            ? object[propertyName]
            : (object as dynamic).toJson()[propertyName];

    return value?.toDouble();
  }
}
