class Location {
  final int id;
  final String name;
  final String city;
  final double lat;
  final double long;

  Location({
    required this.id,
    required this.name,
    required this.city,
    required this.lat,
    required this.long,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'lat': lat,
      'long': long,
    };
  }
}
