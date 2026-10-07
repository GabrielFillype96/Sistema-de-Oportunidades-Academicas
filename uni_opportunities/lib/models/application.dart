import 'opportunity.dart';

// The application screen can only use one of these defined stages
enum ApplicationStage {
  submitted,
  underReview,
  preSelection,
  interview,
  result,
  pendingDocumentation,
  cancelled,
}

class Application {
  final Opportunity opportunity;
  final ApplicationStage stage;
  final DateTime appliedAt;
  final DateTime lastUpdated;

  Application({
    required this.opportunity,
    required this.stage,
    required this.appliedAt,
    required this.lastUpdated,
  });
}