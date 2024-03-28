import 'package:flutter/material.dart';

import '../api/get_businesses_by_search_api.dart';
import '/models/business_data.dart';
import '/screens/businesses_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BusinessData? businessData;
  bool _isLoading = false;
  // @override
  // void initState() {
  //   YelpFusionApi().getBusinesses('Neverland');
  //   super.initState();
  // }
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true; // Set loading state before fetching
    });
    try {
      businessData = await GetBusinessesBySearchApi.getBusinesses(
        text: '',
      );
      setState(() {
        _isLoading = false; // Update loading state after successful fetch
      });
    } catch (error) {
      // Handle errors appropriately, e.g., display an error message
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yelp Fusion API'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : BusinessesScreen(
              businessData: businessData!,
            ),
    );
  }
}
