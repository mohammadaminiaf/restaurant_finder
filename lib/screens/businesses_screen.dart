import 'package:flutter/material.dart';

import '/models/business.dart';
import '/models/business_data.dart';

class BusinessesScreen extends StatelessWidget {
  const BusinessesScreen({
    super.key,
    required this.businessData,
  });

  final BusinessData businessData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${businessData.businesses.length} restaurants found'),
      ),
      body: businessData.businesses.isEmpty
          ? const Center(
              child: Text('No business for this location'),
            )
          : ListView.builder(
              itemCount: businessData.businesses.length,
              itemBuilder: (context, index) {
                final businessItem = businessData.businesses[index];

                return BusinessItem(
                  business: businessItem,
                );
              },
            ),
    );
  }
}

class BusinessItem extends StatelessWidget {
  const BusinessItem({
    super.key,
    required this.business,
  });

  final Business business;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(business.imageUrl),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  business.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Phone Number: ${business.phone}'),
                Text('Details: ${business.alias}'),
                Text('Price: ${business.price}'),
                Text(
                    'Categories: ${business.categories.map((e) => e.title).toList()}'),
                Text('Closed: ${business.isClosed}'),
                Text(
                    'Location: ${business.location.city + ', ' + business.location.country}'),
                Text('Rating: ${business.rating}'),
                Text('Review count: ${business.reviewCount}'),
                Text('Transcations: ${business.transactions}'),
                Text('Distance: ${business.distance}'),
                Text(
                    'Attributes: ${business.attributes.entries.map((e) => e.key).toList()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
