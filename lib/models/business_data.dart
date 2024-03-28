import '/models/business.dart';

class BusinessData {
  final List<Business> businesses;
  final int total;
  final Region region;

  BusinessData({
    required this.businesses,
    required this.total,
    required this.region,
  });

  factory BusinessData.fromJson(Map<String, dynamic> json) {
    final List<dynamic> businessesList = json['businesses'] ?? [];
    final List<Business> businesses =
        businessesList.map((bizJson) => Business.fromJson(bizJson)).toList();

    return BusinessData(
      businesses: businesses,
      total: json['total'] ?? 0,
      region: Region.fromJson(json['region'] ?? {}),
    );
  }
}

class Region {
  final Coordinates center;

  Region({
    required this.center,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      center: Coordinates.fromJson(json['center'] ?? {}),
    );
  }
}

class Coordinates {
  final double longitude;
  final double latitude;

  Coordinates({
    required this.longitude,
    required this.latitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      longitude: json['longitude'] ?? 0.0,
      latitude: json['latitude'] ?? 0.0,
    );
  }
}

// The Business and Category classes remain unchanged
