import 'package:flutter/material.dart';
import '../../data/mock_opportunities.dart';
import '../../widgets/opportunity_card.dart';


class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Verify how many opportunities are
    debugPrint('Number of opportunities: ${mockOpportunities.length}');


    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              // Use "Row" because the elements will be arranged horizontally
              Row(
                children: [
                  const Text(
                    'Uni',
                    style: TextStyle(
                      color: Color(0xFF22D3EE),
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Oportunidades',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Pushes the notification and profile icons to the right
                  const Spacer(),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    ),
                  ),

                  const CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Search field
              TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Search for internships and scholarships...',
                  hintStyle: const TextStyle(
                    color: Colors.white54,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white54,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF293241),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Categories
              SingleChildScrollView(
                // Allows us to scroll horizontally
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('All', true),
                    _buildCategoryChip('Scientific initiation', false),
                    _buildCategoryChip('Scholarships ', false),
                    _buildCategoryChip('Internship', false),
                    _buildCategoryChip('Extensions', false),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Expanded allows the ListView to know how much remaining vertical space it can use
              Expanded(
                // This structure "ListView.builder" allows us to build one card for each opportunity
                child: ListView.builder(
                  itemCount: mockOpportunities.length,
                  itemBuilder: (context, index) {
                    // Gets the current opportunity
                    final opportunity = mockOpportunities[index];

                    // Give the opportunity data to the widget ()
                    return OpportunityCard(
                      opportunity: opportunity,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Creates a reusable category chip
  Widget _buildCategoryChip(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (value) {},
        selectedColor: const Color(0xFF22D3EE),
        backgroundColor: const Color(0xFF111827),
        labelStyle: TextStyle(
          color: selected ? Colors.black : Colors.white,
        ),
        side: const BorderSide(
          color: Color(0xFF4B5563),
        ),
      ),
    );
  }
}