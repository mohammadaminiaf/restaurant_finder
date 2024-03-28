import 'dart:convert';

import 'package:http/http.dart' as http;

import '/config/config.dart';
import '/models/business_details.dart';

class GetBusinessesDetailsApi {
  //! You can use this url to curl data in cmd
  // curl -X GET "https://api.yelp.com/v3/businesses/6TL8udi-vy_5rH-wikMSoA" -H "Authorization: Bearer riw09D5Bnk6JfcS_8dOopSIVu0pexxkW7FbOzxVffij9itfgDK4kPx4U2JSMkD1qbNpZGuJb_6aWAhdMm6CnYcjF81jAgXUs5uYFkDUb84TdVmDzZQtgFj_o2KMDZnYx" -H "accept: application/json"

  static const baseUrl = 'https://api.yelp.com/v3';

  static Future<BusinessDetails> getBusinesses({
    required String id,
  }) async {
    final headers = {
      'Authorization': 'Bearer $apiKey',
      'accept': 'application/json',
    };

    final url = Uri.parse(
      '$baseUrl/businesses/$id',
    );

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final businessData = BusinessDetails.fromJson(data);
      return businessData;
    } else {
      print('Error: ${response.body}');
      print('Code: ${response.statusCode}');
      throw Exception(response.body);
    }
  }
}
