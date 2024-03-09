import 'package:geo_sort/src/extensions/extensions.dart';
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
      final lat = getDoublePropertyValue(item, 'latitude');
      final long = getDoublePropertyValue(item, 'longitude');

      if (lat == null || long == null) continue;

      double distance =
          getDistanceFromLatLonInKm(latitude, longitude, lat, long);
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
  ///
  static double? getDoublePropertyValue<T>(T object, String propertyName) {
    if (object is HasLocation) {
      // If the object implements HasLocation, we can directly access its latitude and longitude properties
      if (propertyName == 'latitude') {
        return object.latitude;
      } else if (propertyName == 'longitude') {
        return object.longitude;
      }
    }
    // If the object does not contain the desired property or is not of a compatible type, return null
    return null;
  }
}
