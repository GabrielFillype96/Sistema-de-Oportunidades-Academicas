import 'package:flutter/material.dart';
import '../data/favorites_repository.dart';
import '../models/opportunity.dart';
import '../screens/student/opportunity_details_screen.dart';

class OpportunityCard extends StatefulWidget {
  final Opportunity opportunity;

  const OpportunityCard({
    super.key,
    required this.opportunity,
  });

  @override
  State<OpportunityCard> createState() => _OpportunityCardState();
}

class _OpportunityCardState extends State<OpportunityCard> {
  bool get _isFavorite => FavoritesRepository.isFavorite(widget.opportunity);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 4,
        right: 4,
        bottom: 20,
      ),

      padding: const EdgeInsets.all(22),
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
          // Opportunity title and favorite button
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.opportunity.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ),

              IconButton(
                onPressed: () {
                  // Handles with the favorite state, when press the favorite button
                  setState(() {
                    if (_isFavorite) {
                      FavoritesRepository.removeFavorite(
                        widget.opportunity,
                      );
                    } else {
                      FavoritesRepository.addFavorite(
                        widget.opportunity,
                      );
                    }
                  });
                },
                icon: Icon(
                  _isFavorite
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  // Ternary operator    
                  color: _isFavorite ? const Color(0xFF22D3EE) : Colors.white70,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Opportunity type and area
          Row(
            children: [
              _buildTag(
                widget.opportunity.type,
                _getTypeColor(widget.opportunity.type),
              ),
              const SizedBox(width: 8),
              _buildTag(
                widget.opportunity.area,
                const Color(0xFF4B5563),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Compatibility
          Text(
            '${widget.opportunity.compatibility}% compatible',
            style: TextStyle(
              color: _getTypeColor(widget.opportunity.type),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

          // Description
          Text(
            widget.opportunity.description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          // Divider
          const Divider(
            color: Color(0xFF4B5563),
          ),

          const SizedBox(height: 20),

          // Responsible
          Text(
            'Responsible: ${widget.opportunity.responsible}',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 16),

          // Deadline and details button
          Row(
            children: [
              // Fill all remaining available space
              Expanded(
                child: Text(
                  'Deadline: ${widget.opportunity.deadline}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OpportunityDetailsScreen(
                        opportunity: widget.opportunity,
                      ),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF22D3EE),
                  side: const BorderSide(
                    color: Color(0xFF22D3EE),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Visualize',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
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
}