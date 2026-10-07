import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const UniOpportunitiesApp());
}

class UniOpportunitiesApp extends StatelessWidget {
  const UniOpportunitiesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UnDFOpportunities',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}