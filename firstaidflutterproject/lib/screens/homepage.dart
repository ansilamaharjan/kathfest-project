import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              const SizedBox(height: 24),
              _buildHeadline(),
              const SizedBox(height: 14),
              _buildSubtitleRow(),
              const SizedBox(height: 24),
              _buildEmergencyHelpCard(),
              const SizedBox(height: 28),
              _buildQuickAccessHeader(),
              const SizedBox(height: 16),
              _buildQuickAccessGrid(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // "FirstAid+" logo, search icon, profile icon
  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "FirstAid+",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF10214B),
          ),
        ),
        Row(
          children: [
            const Icon(Icons.search, color: Color(0xFF10214B), size: 24),
            const SizedBox(width: 18),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF10214B), width: 1.5),
              ),
              child: const Icon(
                Icons.person_outline,
                color: Color(0xFF10214B),
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeadline() {
    return Text(
      "Stay Calm. Help is Always Available.",
      style: GoogleFonts.poppins(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF10214B),
        height: 1.25,
      ),
    );
  }

  // "Offline Emergency Assistance" + "OFFLINE READY" pill badge
  Widget _buildSubtitleRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "Offline Emergency Assistance",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xFF30232D).withValues(alpha: 0.55),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF30232D).withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 14,
                color: Color(0xFF10214B),
              ),
              const SizedBox(width: 6),
              Text(
                "OFFLINE\nREADY",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  letterSpacing: 0.4,
                  color: const Color(0xFF10214B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Big red "Emergency Help" call-to-action card
  Widget _buildEmergencyHelpCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFD55053),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.emergency_share_outlined,
            color: Colors.white,
            size: 34,
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("🚨", style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Text(
                "EMERGENCY HELP",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Quick Access",
          style: GoogleFonts.poppins(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF10214B),
          ),
        ),
        Text(
          "View All",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFD55053),
          ),
        ),
      ],
    );
  }

  // 2-column grid of quick-access emergency categories
  Widget _buildQuickAccessGrid() {
    final items = [
      {
        "icon": Icons.favorite,
        "label": "CPR",
        "color": const Color(0xFFD55053),
      },
      {
        "icon": Icons.bloodtype,
        "label": "Bleeding",
        "color": const Color(0xFFD55053),
      },
      {
        "icon": Icons.local_fire_department,
        "label": "Burns",
        "color": const Color(0xFFE07A3F),
      },
      {
        "icon": Icons.person,
        "label": "Choking",
        "color": const Color(0xFF10214B),
      },
      {
        "icon": Icons.personal_injury_outlined,
        "label": "Fainting",
        "color": const Color(0xFF10214B),
      },
      {
        "icon": Icons.healing,
        "label": "Fracture",
        "color": const Color(0xFF10214B),
      },
      {
        "icon": Icons.pest_control_rodent,
        "label": "Snake Bite",
        "color": const Color(0xFF30232D),
      },
      {
        "icon": Icons.bolt,
        "label": "Electric Shock",
        "color": const Color(0xFFD55053),
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 22,
        childAspectRatio: 1.15,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFF10214B).withValues(alpha: 0.25),
                  width: 1.5,
                ),
              ),
              child: Icon(
                item["icon"] as IconData,
                color: item["color"] as Color,
                size: 28,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item["label"] as String,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF10214B),
              ),
            ),
          ],
        );
      },
    );
  }
}
