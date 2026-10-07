import 'package:flutter/material.dart';
import '../../data/application_repository.dart';
import '../../models/application.dart';
import '../../widgets/application_card.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get all the applications that have been stored
    // in our temporary "application_repository".
    final applications = ApplicationRepository.getApplications();

    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Inscrições',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // Ternary operator
              // Dynamically changes the text to represent the right number of applications
              applications.length == 1 ? '1 Active application' : '${applications.length} Active applications',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Track your application progress',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemCount: applications.length,
                itemBuilder: (context, index) {
                  final application = applications[index];

                  return ApplicationCard(
                    application: application,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}