import 'dart:math';

/// Calculates the distance between two geographic coordinates in kilometers.
double getDistanceFromLatLonInKm(double lat1, double lon1, double lat2, double lon2) {
  const double R = 6371; // Radius of the earth in km
  double dLat = _deg2rad(lat2 - lat1); // Convert latitudes to radians
  double dLon = _deg2rad(lon2 - lon1); // Convert longitudes to radians
  double a = (sin(dLat / 2) * sin(dLat / 2)) +
      (cos(_deg2rad(lat1)) * cos(_deg2rad(lat2)) * sin(dLon / 2) * sin(dLon / 2));
  double c = 2 * atan2(sqrt(a), sqrt(1 - a)); // Calculate central angle using haversine formula
  double d = R * c; // Calculate distance
  return d; // Return distance in kilometers
}

/// Converts degrees to radians.
double _deg2rad(double deg) {
  return deg * (pi / 180);
}
