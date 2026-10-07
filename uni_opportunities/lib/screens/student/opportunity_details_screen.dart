import 'package:flutter/material.dart';
import '../../models/opportunity.dart';
import '../../models/application.dart';
import '../../data/application_repository.dart';

class OpportunityDetailsScreen extends StatelessWidget {
  final Opportunity opportunity;

  const OpportunityDetailsScreen({
    super.key,
    required this.opportunity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),

      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Opportunity Details',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                opportunity.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 20),

              // Type and area
              Row(
                children: [
                  _buildTag(
                    opportunity.type,
                    _getTypeColor(opportunity.type),
                  ),

                  const SizedBox(width: 8),

                  _buildTag(
                    opportunity.area,
                    const Color(0xFF4B5563),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Compatibility
              Text(
                '${opportunity.compatibility}% compatible',
                style: TextStyle(
                  color: _getTypeColor(opportunity.type),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 28),

              // Description
              const Text(
                'About this opportunity',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                opportunity.description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              // Information
              _buildInformation(
                'Responsible',
                opportunity.responsible,
              ),

              const SizedBox(height: 18),

              _buildInformation(
                'Deadline',
                opportunity.deadline,
              ),

              const Spacer(),

              // Apply button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showApplyConfirmation(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF22D3EE),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildInformation(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'SI':
        return const Color(0xFF22D3EE);

      case 'Internship':
        return const Color(0xFFF59E0B);

      case 'Scholarship':
        return const Color(0xFFA855F7);

      default:
        return const Color(0xFF4B5563);
    }
  }

  // When the student press the "Apply" button, calls this function
  void _showApplyConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Apply for this opportunity?'),
          content: Text(
            'You are about to apply for:\n\n'
            '${opportunity.title}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final now = DateTime.now();

                // When the application is submitted create an "application" object
                // from the opportunity the student selected
                final application = Application(
                  opportunity: opportunity,
                  stage: ApplicationStage.submitted,
                  appliedAt: now,
                  lastUpdated: now,
                );

                ApplicationRepository.addApplication(application);
                
                // Just to see if the application has been created
                debugPrint(
                  'Total applications: '
                  '${ApplicationRepository.getApplications().length}',
                );

                debugPrint(
                  'Application created: '
                  '${application.opportunity.title} - '
                  '${application.stage}',
                );

                Navigator.pop(context);
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }
}