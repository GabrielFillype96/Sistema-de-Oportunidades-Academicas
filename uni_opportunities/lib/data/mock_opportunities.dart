import '../models/opportunity.dart';

// For now, it's just a mock data to simulate the Firebase data
final List<Opportunity> mockOpportunities = [
  Opportunity(
    title: 'Scientific Initiation Scholarship - IA',
    type: 'SI',
    area: 'Software Eng.',
    description:
        'Undergraduate Research Scholarship in Artificial Intelligence applied to Software Engineering.',
    responsible: 'Dra. Ana Silva',
    deadline: '3 days remaining',
    compatibility: 98,
  ),

  Opportunity(
    title: 'Web Development Internship',
    type: 'Internship',
    area: 'Computing',
    description:
        'Web development internship involving participation in real-world technology projects.',
    responsible: 'TechCorp',
    deadline: '10 days remaining',
    compatibility: 85,
  ),

  Opportunity(
    title: 'Permanence Scholarship - 2026 Notice',
    type: 'Scholarship',
    area: 'Socioeconomic',
    description:
        'Financial aid and student retention program aimed at students with specific socioeconomic circumstances.',
    responsible: 'PROEX',
    deadline: '15 days remaining',
    compatibility: 80,
  ),
];