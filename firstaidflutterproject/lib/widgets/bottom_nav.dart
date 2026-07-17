import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Reusable bottom navigation bar. Pass in the currently selected index
/// and a callback for when a tab is tapped — use this same widget on
/// every page that needs the nav bar, driven by whatever screen wrapper
/// is managing the selected index (see main_nav_screen.dart).
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<_NavItem> _items = [
    _NavItem(icon: Icons.home_outlined, label: "Home"),
    _NavItem(icon: Icons.assignment_outlined, label: "Assessment"),
    _NavItem(icon: Icons.call_outlined, label: "Emergency"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final isSelected = index == currentIndex;

            return GestureDetector(
              onTap: () => onTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF10214B).withValues(alpha: 0.08)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected
                          ? const Color(0xFF10214B)
                          : const Color(0xFF30232D).withValues(alpha: 0.45),
                      size: 22,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: isSelected
                            ? const Color(0xFF10214B)
                            : const Color(0xFF30232D).withValues(alpha: 0.45),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}
