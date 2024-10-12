import 'package:aio_fitness/models/user.dart';
import 'package:flutter/material.dart';
import 'food_intake_tracker.dart';
import 'water_intake_tracker.dart';
import 'home_page.dart';
import 'workout.dart';
import 'profile.dart';
// import '../models/user.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key, required this.user});

  final User user;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 2; // Set HomePage() as the default page

  late final List<Widget> _pages;
  
  @override
  void initState() {
    super.initState();
    _pages = [
      const FoodIntakeTracker(),
      const WaterIntakeTracker(),
      const HomePage(),
      const Workout(),
      Profile(user: widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Food'),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: 'Water'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workout'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}