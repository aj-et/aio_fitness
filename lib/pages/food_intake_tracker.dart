import 'package:flutter/material.dart';

// Placeholder pages for each navigation item
class FoodIntakeTracker extends StatelessWidget {
  const FoodIntakeTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Intake Tracker'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: const Center(
        child: Text('Food Intake Tracking Page'),
      ),
    );
  }
}