import 'package:flutter/material.dart';
import '../models/user.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.user});

  final User user;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Text(
                  user.username[0].toUpperCase(),
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              _buildInfoCard('Username', user.username),
              _buildInfoCard('Email', user.email),
              _buildInfoCard('Age', '${user.age} years'),
              _buildInfoCard('Height', '${user.height} cm'),
              _buildInfoCard('Weight', '${user.weight} kg'),
              _buildInfoCard('Fitness Goal', user.fitnessGoal),
              _buildInfoCard('Activity Level', user.activityLevel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}