import 'package:flutter/material.dart';

import '../../data/favorites_repository.dart';
import '../../widgets/opportunity_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = FavoritesRepository.getFavorites();

    return Scaffold(
      backgroundColor: const Color(0xFF111827),

      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: favorites.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final opportunity = favorites[index];

                  return OpportunityCard(
                    opportunity: opportunity,
                  );
                },
              ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.bookmark_border,
            color: Colors.white54,
            size: 64,
          ),

          const SizedBox(height: 20),

          const Text(
            'No favorites yet',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Save opportunities you like\n'
            'by tapping the bookmark icon.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}