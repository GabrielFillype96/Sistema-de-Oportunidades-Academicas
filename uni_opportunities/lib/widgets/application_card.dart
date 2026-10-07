import 'package:flutter/material.dart';

import '../models/application.dart';

// By now, it's a stateless widget
class ApplicationCard extends StatelessWidget {
  final Application application;

  const ApplicationCard({
    super.key,
    required this.application,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF293241),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF4B5563),
        ),
      ),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Opportunity title
          Text(
            application.opportunity.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // Opportunity type and area
          Row(
            children: [
              _buildTag(
                application.opportunity.type,
                _getTypeColor(application.opportunity.type),
              ),
              const SizedBox(width: 8),
              _buildTag(
                application.opportunity.area,
                const Color(0xFF4B5563),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Application status
          Text(
            _getStageLabel(application.stage),
            style: TextStyle(
              color: _getStageColor(application.stage),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          // Application progress
          _buildProgress(),

          const SizedBox(height: 20),

          // Application date
          Text(
            'Applied on: ${_formatDate(application.appliedAt)}',
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // This widget build the filter tags
  Widget _buildTag(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
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

  Widget _buildProgress() {
    const stages = [
      ApplicationStage.submitted,
      ApplicationStage.underReview,
      ApplicationStage.preSelection,
      ApplicationStage.interview,
      ApplicationStage.result,
    ];

    final currentIndex = stages.indexOf(application.stage);

    return Row(
      children: List.generate(
        stages.length,
        (index) {
          final isCompleted =
              currentIndex >= 0 && index <= currentIndex;

          return Expanded(
            child: Row(
              children: [
                // Fill all remaining available space
                Expanded(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(
                      // Ternary operator
                      color: isCompleted ? const Color(0xFF22D3EE) : const Color(0xFF4B5563),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                if (index < stages.length - 1)
                  const SizedBox(width: 4),
              ],
            ),
          );
        },
      ),
    );
  }

  //Return the application stage
  String _getStageLabel(ApplicationStage stage) {
    switch (stage) {
      case ApplicationStage.submitted:
        return 'Sent';

      case ApplicationStage.underReview:
        return 'Under review';

      case ApplicationStage.preSelection:
        return 'Pre-selection';

      case ApplicationStage.interview:
        return 'Interview';

      case ApplicationStage.result:
        return 'Result';

      case ApplicationStage.pendingDocumentation:
        return 'Pending documentation';

      case ApplicationStage.cancelled:
        return 'Canceled';
    }
  }

  // Defines the progress color (by now, ony three)
  Color _getStageColor(ApplicationStage stage) {
    switch (stage) {
      case ApplicationStage.submitted:
      case ApplicationStage.underReview:
      case ApplicationStage.preSelection:
      case ApplicationStage.interview:
      case ApplicationStage.result:
        return const Color(0xFF22D3EE);

      case ApplicationStage.pendingDocumentation:
        return const Color(0xFFF59E0B);

      case ApplicationStage.cancelled:
        return const Color(0xFFEF4444);
    }
  }

  // Defines the opportunity color based in the type
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

  // Return the date that the user applies
  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }
}