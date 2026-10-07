import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import 'feed_screen.dart';
import 'applications_screen.dart';
import 'profile_screen.dart';

class StudentNavigation extends StatefulWidget {
  const StudentNavigation({super.key});

  @override
  State<StudentNavigation> createState() => _StudentNavigationState();
}

class _StudentNavigationState extends State<StudentNavigation> {
  int _currentIndex = 0;

  // Create a list of widgets
  final List<Widget> _screens = [
    const FeedScreen(),
    const FavoritesScreen(),
    const ApplicationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Get the index of the screen (widget)
      body: _screens[_currentIndex],

      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF293241),
        indicatorColor: const Color(0xFF4B5563),
        surfaceTintColor: Colors.transparent,
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white70,
            ),
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Feed',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.white70,
            ),
            selectedIcon: Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.assignment_outlined,
              color: Colors.white70,
            ),
            selectedIcon: Icon(
              Icons.assignment,
              color: Colors.white,
            ),
            label: 'Applications',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              color: Colors.white70,
            ),
            selectedIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}