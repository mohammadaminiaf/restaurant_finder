import 'dart:convert';

import 'package:http/http.dart' as http;

import '/config/config.dart';
import '/models/business_data.dart';
import '/services/geolocator.dart';

class GetBusinessesBySearchApi {
  //! You can use this url to curl data in cmd
  // curl -X GET "https://api.yelp.com/v3/businesses/search?latitude=37.786882&longitude=-122.399972" -H "Authorization: Bearer riw09D5Bnk6JfcS_8dOopSIVu0pexxkW7FbOzxVffij9itfgDK4kPx4U2JSMkD1qbNpZGuJb_6aWAhdMm6CnYcjF81jAgXUs5uYFkDUb84TdVmDzZQtgFj_o2KMDZnYx" -H "accept: application/json"

  static const baseUrl = 'https://api.yelp.com/v3';
  // static const latitude = 37.786882;
  // static const longitude = -122.399972;

  static Future<BusinessData> getBusinesses({
    required String text,
    int? price,
    bool? openNow,
    String? categories,
    String? attributes,
    int? radius,
  }) async {
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'accept': 'application/json',
    };

    final position = await determinePosition();

    final latitude = position.latitude;
    final longitude = position.longitude;

    final url = Uri.parse(
      '$baseUrl/businesses/search?term=$text&radius=$radius&categories=$categories&attributes=$attributes&price=$price&open_now=$openNow&limit=50&latitude=$latitude&longitude=$longitude',
    );

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final businessData = BusinessData.fromJson(data);
      return businessData;
    } else {
      print('Error: ${response.body}');
      print('Code: ${response.statusCode}');
      throw Exception(response.body);
    }
  }
}
