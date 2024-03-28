class BusinessDetails {
  final String id;
  final String alias;
  final String name;
  final String imageUrl;
  final bool isClaimed;
  final bool isClosed;
  final String url;
  final String phone;
  final String displayPhone;
  final int reviewCount;
  final List<Category> categories;
  final double rating;
  final Location? location;
  final Coordinates? coordinates;
  final List<String> photos;
  final String price;
  final List<Hour> hours;
  final List<String> transactions;

  BusinessDetails({
    required this.id,
    required this.alias,
    required this.name,
    required this.imageUrl,
    required this.isClaimed,
    required this.isClosed,
    required this.url,
    required this.phone,
    required this.displayPhone,
    required this.reviewCount,
    required this.categories,
    required this.rating,
    required this.location,
    required this.coordinates,
    required this.photos,
    required this.price,
    required this.hours,
    required this.transactions,
  });

  factory BusinessDetails.fromJson(Map<String, dynamic> json) {
    return BusinessDetails(
      id: json['id'],
      alias: json['alias'],
      name: json['name'],
      imageUrl: json['image_url'],
      isClaimed: json['is_claimed'],
      isClosed: json['is_closed'],
      url: json['url'],
      phone: json['phone'],
      displayPhone: json['display_phone'],
      reviewCount: json['review_count'],
      categories: json['categories'] != null
          ? json['categories'].map((category) => Category.fromJson(category))
          : [],
      rating: json['rating'],
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      coordinates: json['coordinates'] != null
          ? Coordinates.fromJson(json['coordinates'])
          : null,
      photos: json['photos']?.cast<String>(),
      price: json['price'],
      hours: json['hours'] != null
          ? json['hours'].map((hour) => Hour.fromJson(json['hours'])).toList()
          : [],
      transactions: json['transactions']?.cast<String>(),
    );
  }
}

class Category {
  final String alias;
  final String title;

  Category({
    required this.alias,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      alias: json['alias'],
      title: json['title'],
    );
  }
}

class Location {
  final String address1;
  final String address2;
  final String address3;
  final String city;
  final String zipCode;
  final String country;
  final String state;
  final List<String> displayAddress;
  final String crossStreets;

  Location({
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.zipCode,
    required this.country,
    required this.state,
    required this.displayAddress,
    required this.crossStreets,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address1: json['address1'],
      address2: json['address2'],
      address3: json['address3'],
      city: json['city'],
      zipCode: json['zip_code'],
      country: json['country'],
      state: json['state'],
      displayAddress: json['display_address']?.cast<String>(),
      crossStreets: json['cross_streets'],
    );
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class Hour {
  final List<Open> open;
  final String hoursType;
  final bool isOpenNow;

  Hour({
    required this.open,
    required this.hoursType,
    required this.isOpenNow,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      open:
          json['open']?.map((open) => Open.fromJson(open)).toList() ?? const [],
      hoursType: json['hours_type'] as String,
      isOpenNow: json['is_open_now'] as bool,
    );
  }
}

class Open {
  final bool isOvernight;
  final String start;
  final String end;
  final int day;

  Open({
    required this.isOvernight,
    required this.start,
    required this.end,
    required this.day,
  });

  factory Open.fromJson(Map<String, dynamic> json) {
    return Open(
      isOvernight: json['is_overnight'],
      start: json['start'],
      end: json['end'],
      day: json['day'],
    );
  }
}
