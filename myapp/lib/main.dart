import 'package:flutter/material.dart';






import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/reset_password_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/progress_tracking_screen.dart';
import 'screens/pharmacy_screen.dart';
import 'screens/gym_bot_screen.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const HealthFitApp());
}

class HealthFitApp extends StatelessWidget {
  const HealthFitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthFit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/reset_password': (context) => const ResetPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/progress': (context) => const ProgressTrackingScreen(),
        '/pharmacy': (context) => const PharmacyScreen(),
        '/gym_diet': (context) => const GymDietScreen(),
        '/chat': (context) => const ChatScreen(),
      },
    );
  }
}

// User Model
class User {
  final String id;
  final String name;
  final String email;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });
}

// Mock Database Service (simulating backend)
class DatabaseService {
  static List<User> _users = [];

  static Future<User?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return _users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => throw Exception('Invalid credentials'),
    );
  }

  static Future<User> signup(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    final user = User(
      id: 'user_${_users.length + 1}',
      name: name,
      email: email,
      password: password,
    );
    _users.add(user);
    return user;
  }

  static Future<void> resetPassword(String email, String newPassword) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    final user = _users.firstWhere(
      (user) => user.email == email,
      orElse: () => throw Exception('Email not found'),
    );
    _users[_users.indexOf(user)] = User(
      id: user.id,
      name: user.name,
      email: user.email,
      password: newPassword,
    );
  }
} 