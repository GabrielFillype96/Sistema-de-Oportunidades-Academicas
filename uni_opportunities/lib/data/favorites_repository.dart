import '../models/opportunity.dart';

class FavoritesRepository {
  static final List<Opportunity> _favorites = [];

  static void addFavorite(Opportunity opportunity) {
    if (!_favorites.contains(opportunity)) {
      _favorites.add(opportunity);
    }
  }

  static void removeFavorite(Opportunity opportunity) {
    _favorites.remove(opportunity);
  }

  static bool isFavorite(Opportunity opportunity) {
    return _favorites.contains(opportunity);
  }

  static List<Opportunity> getFavorites() {
    return List.unmodifiable(_favorites);
  }
}