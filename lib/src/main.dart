import 'package:geo_sort/src/utils/utils.dart';

class GeoSort {
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

  static double? _getDoubleValue<T>(T object, String propertyName) {
    final value = object is Map<String, dynamic>
        ? object[propertyName]
        : object is Map<String, Object?>
            ? object[propertyName]
            : (object as dynamic).toJson()[propertyName];

    return value?.toDouble();
  }
}
