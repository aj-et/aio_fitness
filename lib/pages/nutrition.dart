import 'package:flutter/material.dart';
import 'food_intake_tracker.dart'; // Import your Food Intake Tracker
import 'water_intake_tracker.dart'; // Import your Water Intake Tracker
import '../screens/animation_screen.dart';

class Nutrition extends StatelessWidget {
  const Nutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              elevation: 5,
              child: ListTile(
                title: const Text('Food Intake Tracker', textAlign: TextAlign.center),
                onTap: () {
                  // Navigate to Food Intake Tracker screen with custom animation
                  Navigator.push(context, createRoute(const FoodIntakeTracker()));
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              elevation: 5,
              child: ListTile(
                title: const Text('Water Intake Tracker', textAlign: TextAlign.center),
                onTap: () {
                  // Navigate to Water Intake Tracker screen with custom animation
                  Navigator.push(context, createRoute(const WaterIntakeTracker()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}