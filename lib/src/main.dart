import 'dart:math';

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates(this.latitude, this.longitude);
}

List<Map<String, dynamic>> sortByCoordinate(
    List<Map<String, dynamic>> locations, Coordinates reference,
    {bool ascending = true}) {
  _calculateDistance(locations, reference);

  locations.sort((a, b) {
    double distanceA = a['distance'];
    double distanceB = b['distance'];
    return ascending ? distanceA.compareTo(distanceB) : distanceB.compareTo(distanceA);
  });

  return locations;
}

List<Map<String, dynamic>> sortByLatLong(
    List<Map<String, dynamic>> locations, double latitude, double longitude,
    {bool ascending = true}) {
  Coordinates reference = Coordinates(latitude, longitude);
  return sortByCoordinate(locations, reference, ascending: ascending);
}

void _calculateDistance(List<Map<String, dynamic>> locations, Coordinates reference) {
  for (var location in locations) {
    if (!location.containsKey('distance')) {
      double lat = location['lat'];
      double lon = location['long'];
      double distance =
          getDistanceFromLatLonInKm(reference.latitude, reference.longitude, lat, lon);
      location['distance'] = distance;
    }
  }
}

double getDistanceFromLatLonInKm(double lat1, double lon1, double lat2, double lon2) {
  const double R = 6371; // Radius of the earth in km
  double dLat = deg2rad(lat2 - lat1); // deg2rad below
  double dLon = deg2rad(lon2 - lon1);
  double a = (sin(dLat / 2) * sin(dLat / 2)) +
      (cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2));
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double d = R * c; // Distance in km
  return d; // distance returned
}

double deg2rad(double deg) {
  return deg * (pi / 180);
}
