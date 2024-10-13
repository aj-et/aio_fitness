import 'package:flutter/material.dart';
import '../pages/main_app.dart';
import 'register_screen.dart';
import '../models/user.dart';
import '../screens/animation_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_password.isEmpty) {
        const Text('Please enter your password'); // Placeholder for error handling
      } else {
        // Simulate login by creating a dummy user
        final dummyUser = User(
          username: _username,
          email: '$_username@example.com',
          age: 27,
          height: 167.64,
          weight: 87,
          fitnessGoal: 'Weight Loss',
          activityLevel: 'Moderately Active',
        );

        // Navigate to MainApp and pass the user data with custom animation
        Navigator.of(context).pushReplacement(
          createRoute(MainApp(user: dummyUser)), // Use the createRoute function
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) => _username = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              const Text('Don\'t have an account?'),
              TextButton(
                child: const Text('Register'),
                onPressed: () {
                  Navigator.of(context).push(createRoute(const RegisterScreen())); // Use createRoute for smooth transition
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
