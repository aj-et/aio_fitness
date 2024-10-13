import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:email_validator/email_validator.dart';
import '../models/user.dart';
import '../pages/main_app.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _email = '';
  String _password = '';
  int _age = 0;
  double _height = 0.0;
  double _weight = 0.0;
  String _fitnessGoal = 'Weight Loss';
  String _activityLevel = 'Sedentary';

  final List<String> _fitnessGoals = ['Weight Loss', 'Muscle Gain', 'Maintain Weight', 'Improve Endurance'];
  final List<String> _activityLevels = ['Sedentary', 'Lightly Active', 'Moderately Active', 'Very Active', 'Extremely Active'];

  void _register() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Implement actual registration logic here (Remove on production)
      Logger().i('Username: $_username, Email: $_email, Password: $_password');
      // Create a new User object with the form data
      final user = User(
        username: _username,
        email: _email,
        age: _age,
        height: _height,
        weight: _weight,
        fitnessGoal: _fitnessGoal,
        activityLevel: _activityLevel,
      );
      // After successful registration, navigate to MainApp
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainApp(user: user)),
      );
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return 'Password must include at least one lowercase letter';
    }
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must include at least one uppercase letter';
    }
    if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
      return 'Password must include at least one number';
    }
    if (!RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(value)) {
      return 'Password must include at least one special character';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    if (value.length < 3) {
                      return 'Username must be at least 3 characters long';
                    }
                    return null;
                  },
                  onSaved: (value) => _username = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: validateEmail,
                  onSaved: (value) => _email = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    helperText: 'Password must be at least 8 characters long and include lowercase, uppercase, number, and special character.',
                    helperMaxLines: 3,
                  ),
                  obscureText: true,
                  validator: validatePassword,
                  onSaved: (value) => _password = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) => _age = int.parse(value!),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Height (cm)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) => _height = double.parse(value!),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Weight (kg)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) => _weight = double.parse(value!),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Fitness Goal',
                    border: OutlineInputBorder(),
                  ),
                  value: _fitnessGoal,
                  items: _fitnessGoals.map((String goal) {
                    return DropdownMenuItem<String>(
                      value: goal,
                      child: Text(goal),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _fitnessGoal = newValue!;
                    });
                  },
                  onSaved: (value) => _fitnessGoal = value!,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Activity Level',
                    border: OutlineInputBorder(),
                  ),
                  value: _activityLevel,
                  items: _activityLevels.map((String level) {
                    return DropdownMenuItem<String>(
                      value: level,
                      child: Text(level),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _activityLevel = newValue!;
                    });
                  },
                  onSaved: (value) => _activityLevel = value!,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}