
// This is where we describe the data that a opportunity card need to have
class Opportunity {
  final String title;
  final String type;
  final String area;
  final String description;
  final String responsible;
  final String deadline;
  final int compatibility;

  Opportunity({
    required this.title,
    required this.type,
    required this.area,
    required this.description,
    required this.responsible,
    required this.deadline,
    required this.compatibility,
  });
}