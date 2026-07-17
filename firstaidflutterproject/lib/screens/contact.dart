import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(context),
              const SizedBox(height: 24),
              _buildSectionLabel("NEARBY EMERGENCY NUMBERS"),
              const SizedBox(height: 14),
              _buildMainServicesRow(),
              const SizedBox(height: 28),
              _buildSectionLabel("OTHER SERVICES"),
              const SizedBox(height: 14),
              _buildOtherServicesGrid(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Top bar: title and search icon
  Widget _buildTopBar(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            "Emergency Contacts",
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF10214B),
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.search, color: Color(0xFF10214B)),
        ),
      ],
    );
  }

  Widget _buildSectionLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF30232D).withValues(alpha: 0.6),
        letterSpacing: 0.8,
      ),
    );
  }

  // Police, Ambulance, Fire — the 3 main, larger, highlighted boxes
  Widget _buildMainServicesRow() {
    final services = [
      {"icon": Icons.local_police, "label": "Police", "number": "100"},
      {"icon": Icons.local_hospital, "label": "Ambulance", "number": "102"},
      {"icon": Icons.local_fire_department, "label": "Fire", "number": "101"},
    ];

    return Row(
      children: services.map((service) {
        final isLast = service == services.last;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                      color: Color(0xFFD55053),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      service["icon"] as IconData,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 14),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      service["label"] as String,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF10214B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service["number"] as String,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: const Color.fromARGB(
                        255,
                        0,
                        0,
                        0,
                      ).withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // 4 additional, less-highlighted service boxes.
  Widget _buildOtherServicesGrid() {
    final services = [
      {
        "icon": Icons.person_search,
        "label": "Child Missing Emergency",
        "number": "104",
      },
      {
        "icon": Icons.warning_amber_rounded,
        "label": "Natural Disaster",
        "number": "1155",
      },
      {"icon": Icons.child_care, "label": "Child Helpline", "number": "1098"},
      {"icon": Icons.woman, "label": "Women Helpline", "number": "1145"},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (context, index) {
        final item = services[index];
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF30232D).withValues(alpha: 0.15),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                item["icon"] as IconData,
                color: const Color(0xFF10214B).withValues(alpha: 0.75),
                size: 22,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item["label"] as String,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF10214B).withValues(alpha: 0.85),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item["number"] as String,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFD55053),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
