import 'package:flutter/material.dart';

class WaterIntakeTracker extends StatelessWidget {
  const WaterIntakeTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Intake Tracker'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: const Center(
        child: Text('Water Intake Tracking Page'),
      ),
    );
  }
}