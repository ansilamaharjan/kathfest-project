import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';
import 'contact.dart';
import 'package:firstaidflutterproject/widgets/bottom_nav.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex = 0;

  // Order here must match the order of tabs in CustomBottomNavBar.
  // Swap in the real AssessmentScreen once it's built.
  final List<Widget> _screens = const [
    HomeScreen(),
    _PlaceholderScreen(label: "Assessment"),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

// Simple inline placeholder for tabs that don't have a real page yet.
class _PlaceholderScreen extends StatelessWidget {
  final String label;
  const _PlaceholderScreen({required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAE9D7),
      body: Center(
        child: Text(
          "$label page coming soon",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xFF30232D),
          ),
        ),
      ),
    );
  }
}
