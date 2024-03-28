import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kbspinningwheel/kbspinningwheel.dart';

import '/models/business.dart';
import '/screens/detail_screen.dart';

class SpinningWheelScreen extends StatefulWidget {
  const SpinningWheelScreen({
    super.key,
    required this.businesses,
  });

  final List<Business> businesses;

  @override
  State<SpinningWheelScreen> createState() => _SpinningWheelScreenState();
}

class _SpinningWheelScreenState extends State<SpinningWheelScreen> {
  final StreamController _dividerController = StreamController<int>();

  @override
  void dispose() {
    super.dispose();
    _dividerController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.businesses.length} places found'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SpinningWheel(
              image: Image.asset('assets/images/roulette-8.1-300.png'),
              width: double.infinity,
              height: 400,
              initialSpinAngle: _generateRandomAngle(),
              spinResistance: 0.6,
              canInteractWhileSpinning: false,
              dividers: widget.businesses.length,
              onUpdate: _dividerController.add,
              onEnd: _dividerController.add,
              secondaryImage:
                  Image.asset('assets/images/roulette-center-300.png'),
              secondaryImageHeight: 110,
              secondaryImageWidth: 110,
            ),
            const SizedBox(height: 10),
            StreamBuilder(
              stream: _dividerController.stream,
              builder: (context, snapshot) => snapshot.hasData
                  ? Column(
                      children: [
                        //! Score button
                        RouletteScore(
                          selected: snapshot.data,
                          images: widget.businesses
                              .map((business) => business.imageUrl)
                              .toList(),
                        ),
                        const SizedBox(height: 20),
                        //! Open Destination Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BusinessDetailScreen(
                                  restaurant:
                                      widget.businesses[snapshot.data! - 1],
                                ),
                              ),
                            );
                          },
                          child: const Text('Open Destination'),
                        ),
                      ],
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

class RouletteScore extends StatelessWidget {
  final int selected;
  final List<String> images;

  // Turn images list into a map of index and image url
  final Map<int, String> imagesUrls = {};

  RouletteScore({
    super.key,
    required this.images,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final imagesUrls = {for (var image in images) images.indexOf(image): image};

    return imagesUrls.isNotEmpty
        ? Image.network(
            imagesUrls[selected - 1]!,
            width: 100,
          )
        : const SizedBox.shrink();
  }
}
