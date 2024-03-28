import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yelp_fusion_app/models/attribute.dart';
import 'package:yelp_fusion_app/screens/spinning_wheel_screen.dart';
import 'package:yelp_fusion_app/screens/waiting_screen.dart';

import '../api/get_businesses_by_search_api.dart';
import '/models/category.dart';
import '/screens/businesses_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  bool isLoading = false;
  bool _openNow = true;
  int _selectedPrice = 1;
  double _radius = 1000.0;
  final List<String> _selectedCategories = [];
  final List<String> _selectedAttributes = [];
  final List<String> _priceOptions = ["Broke", "Poor", "Okay", 'Rich'];

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SplashScreen()
        : Scaffold(
            appBar: AppBar(
              title: const Text("Mystery Preferences"),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Food, restaurant...',
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Price Selection
                  const Text(
                    "You are: ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height: 10.0),
                  ToggleButtons(
                    isSelected: List.generate(
                      _priceOptions.length,
                      (index) => index + 1 == _selectedPrice,
                    ),
                    onPressed: (selectedIndex) {
                      setState(() {
                        _selectedPrice = selectedIndex + 1;
                      });
                    },
                    children: _priceOptions
                        .map(
                          (price) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(price),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 20.0),

                  const Text('Categories: '),

                  // Categories
                  Wrap(
                    spacing: 10.0,
                    children: categories
                        .map((category) => ChoiceChip(
                              selected:
                                  _selectedCategories.contains(category.alias),
                              label: Text(category.title),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    _selectedCategories.add(category.alias);
                                  } else {
                                    _selectedCategories.remove(category.alias);
                                  }
                                });
                              },
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 20.0),

                  //! Distance Slider

                  const Text('Distance in meters'),
                  // A Slider that takes a distance between 100 meters to 20000 meters
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                          min: 400,
                          max: 40000,
                          divisions: 11,
                          label: _radius.round().toString(),
                          value: _radius,
                          onChanged: (value) {
                            setState(() {
                              _radius = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text('${_radius.toInt()} meters'),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Open Now"),
                      const SizedBox(width: 10.0),
                      Text(_openNow ? "Yes" : "No"),
                      CupertinoSwitch(
                        value: _openNow,
                        onChanged: (value) {
                          setState(() {
                            _openNow = value;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20.0),

                  const Text('Special Attributes'),

                  const SizedBox(height: 20.0),

                  //! Special Attributes
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: attributes
                        .map((attribute) => ChoiceChip(
                              selected:
                                  _selectedAttributes.contains(attribute.alias),
                              label: Text(attribute.title),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    _selectedAttributes.add(attribute.alias);
                                  } else {
                                    _selectedAttributes.remove(attribute.alias);
                                  }
                                });
                              },
                            ))
                        .toList(),
                  ),

                  const SizedBox(height: 20.0),

                  // Button to proceed with Mystery Search
                  ElevatedButton(
                    onPressed: () async {
                      setState(() => isLoading = true);

                      final businessData =
                          await GetBusinessesBySearchApi.getBusinesses(
                        text: _controller.text.trim(),
                        price: _selectedPrice,
                        openNow: _openNow,
                        categories: _selectedCategories.join(','),
                        attributes: _selectedAttributes.join(','),
                        radius: _radius.toInt(),
                      );

                      setState(() => isLoading = false);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => SpinningWheelScreen(
                            businesses: businessData.businesses,
                          ),
                        ),
                      );
                    },
                    child: const Text("Find My Mystery Restaurant!"),
                  ),
                ],
              ),
            ),
          );
  }
}
