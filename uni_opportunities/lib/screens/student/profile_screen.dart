import 'package:flutter/material.dart';
import '../login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),

      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TextButton(
              // When the "Logout" button is pressed, return to the "Login Screen"
              onPressed: () {
                // Instead of ".pop", these allows us to return to the defined page
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xFF22D3EE),
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            children: [
              // Profile photo
              const CircleAvatar(
                radius: 58,
                backgroundColor: Color(0xFF293241),
                child: Icon(
                  Icons.person,
                  size: 64,
                  color: Colors.white54,
                ),
              ),

              const SizedBox(height: 16),

              // Name
              const Text(
                'Lucas Pereira',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              // Student information
              const Text(
                'Student · 5th Semester',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 28),

              // Academic information
              _buildSectionCard(
                title: 'Academic Information',
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoItem(
                            'Course',
                            'Software Engineering',
                            valueColor: const Color(0xFF22D3EE),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _buildInfoItem(
                            'Student ID',
                            '202201001',
                          ),
                        ),
                      ],
                    ),

                    const Divider(
                      color: Color(0xFF4B5563),
                      height: 24,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoItem(
                            'GPA',
                            '8.7',
                            valueSize: 22,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _buildInfoItem(
                            'Campus',
                            'Central',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Socioeconomic information
              _buildSectionCard(
                title: 'Socioeconomic Information',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInlineInformation(
                      'Income range',
                      'Social Vulnerability',
                      valueColor: const Color(0xFFF59E0B),
                    ),

                    const SizedBox(height: 14),

                    _buildInlineInformation(
                      'Active aid',
                      'Transportation Aid (PRAE)',
                    ),

                    const Divider(
                      color: Color(0xFF4B5563),
                      height: 28,
                    ),

                    const Text(
                      'Documentation',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Income_Proof.pdf',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            // Download will be implemented later.
                          },
                          icon: const Icon(
                            Icons.download_outlined,
                            color: Color(0xFF22D3EE),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            // Document editing will be implemented later.
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: Color(0xFF22D3EE),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Interests
              _buildSectionCard(
                title: 'Interests',
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildInterestTag('Scientific Research'),
                    _buildInterestTag('AI & Machine Learning'),
                    _buildInterestTag('Mobile Development'),
                    _buildInterestTag('Education'),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      label: 'Edit Profile',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildActionButton(
                      label: 'My Documents',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
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
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    String label,
    String value, {
    Color valueColor = Colors.white,
    double valueSize = 16,
  }) {
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
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: valueSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildInlineInformation(
    String label,
    String value, {
    Color valueColor = Colors.white,
  }) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: valueColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterestTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF315F66),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF22D3EE),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}