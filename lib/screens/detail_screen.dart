import 'package:flutter/material.dart';

import '/models/business.dart';

class BusinessDetailScreen extends StatelessWidget {
  final Business restaurant;

  const BusinessDetailScreen({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Stack(
              children: [
                HeroImage(imageUrl: restaurant.imageUrl),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow[700]),
                          Text(
                            restaurant.rating.toStringAsFixed(1),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Information Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.location.address1!),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(Icons.phone),
                      TextButton(
                        onPressed: () {},
                        child: Text(restaurant.phone),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(Icons.link),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            restaurant.url,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  if (restaurant.distance > 0)
                    Row(
                      children: [
                        const Icon(Icons.directions_walk),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                              "${restaurant.distance.toStringAsFixed(1)} meters away"),
                        ),
                      ],
                    ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children: restaurant.categories
                        .map((category) => Chip(label: Text(category.title)))
                        .toList(),
                  ),
                ],
              ),
            ),

            // Description Section (replace with your implementation)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "A short description about the restaurant's atmosphere, offerings, and unique selling points.",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroImage extends StatelessWidget {
  final String imageUrl;

  const HeroImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
