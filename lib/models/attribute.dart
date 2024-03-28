class Attribute {
  final String title;
  final String alias;

  Attribute({
    required this.title,
    required this.alias,
  });

  factory Attribute.fromMap(Map<String, dynamic> map) {
    return Attribute(
      title: map['title'] ?? '',
      alias: map['alias'] ?? '',
    );
  }
}

final List<Attribute> attributes = [
  Attribute(
    title: 'WheelChairs Accessible',
    alias: 'wheelchair_accessible',
  ),
  Attribute(
    title: 'Open to Everyone',
    alias: 'open_to_all',
  ),
  Attribute(
    title: 'Gender Neutral Restrooms',
    alias: 'gender_neutral_restrooms',
  ),
  Attribute(
    title: 'Waitlist Reservation',
    alias: 'waitlist_reservation',
  ),
];
