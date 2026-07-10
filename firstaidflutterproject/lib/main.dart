import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Aid App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFC0392B)),
        scaffoldBackgroundColor: const Color(0xFFFBE9DA),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'First Aid Assistant App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // Quick access grid items: label, icon
  final List<_QuickAccessItem> _quickAccessItems = const [
    _QuickAccessItem('CPR', Icons.favorite_border),
    _QuickAccessItem('Bleeding', Icons.water_drop_outlined),
    _QuickAccessItem('Burns', Icons.local_fire_department_outlined),
    _QuickAccessItem('Choking', Icons.airline_seat_flat_outlined),
    _QuickAccessItem('Fainting', Icons.airline_seat_individual_suite_outlined),
    _QuickAccessItem('Fracture', Icons.check_circle_outline),
    _QuickAccessItem('Snake Bite', Icons.pets_outlined),
    _QuickAccessItem('Electric Shock', Icons.bolt_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBE9DA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              _buildTopBar(),
              const SizedBox(height: 28),
              _buildHeading(),
              const SizedBox(height: 20),
              _buildEmergencyButton(),
              const SizedBox(height: 28),
              _buildQuickAccessHeader(),
              const SizedBox(height: 16),
              _buildQuickAccessGrid(),
              const SizedBox(height: 20),
              _buildSafetyTipCard(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // ---------- Top bar ----------
  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'FirstAid+',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1A1A),
          ),
        ),
        Row(
          children: const [
            Icon(Icons.search, size: 26, color: Color(0xFF1A1A1A)),
            SizedBox(width: 18),
            Icon(
              Icons.account_circle_outlined,
              size: 28,
              color: Color(0xFF1A1A1A),
            ),
          ],
        ),
      ],
    );
  }

  // ---------- Heading ----------
  Widget _buildHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Stay Calm. Help is Always\nAvailable.',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.2,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text(
              'Offline Emergency Assistance',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFE6E1DC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, size: 12, color: Colors.black87),
                  SizedBox(width: 4),
                  Text(
                    'OFFLINE READY',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ---------- Emergency button ----------
  Widget _buildEmergencyButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          // TODO: navigate to emergency help flow
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 28),
          decoration: BoxDecoration(
            color: const Color(0xFFC0272D),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFC0272D).withOpacity(0.35),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Column(
            children: [
              Icon(Icons.emergency_outlined, color: Colors.white, size: 30),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('🚨', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 8),
                  Text(
                    'EMERGENCY HELP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
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

  // ---------- Quick access ----------
  Widget _buildQuickAccessHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Quick Access',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'View All',
            style: TextStyle(
              color: Color(0xFFC0272D),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAccessGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _quickAccessItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.05,
      ),
      itemBuilder: (context, index) {
        final item = _quickAccessItems[index];
        return _QuickAccessCard(item: item);
      },
    );
  }

  // ---------- Safety tip ----------
  Widget _buildSafetyTipCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF101B3D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF4A259),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.lightbulb,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Today's Safety Tip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '"Never pour ice directly onto burns"',
            style: TextStyle(
              color: Colors.white70,
              fontStyle: FontStyle.italic,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Bottom nav ----------
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFC0272D),
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_services_outlined),
          label: 'First Aid',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_outlined),
          label: 'Assessment',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emergency_outlined),
          label: 'Emergency',
        ),
      ],
    );
  }
}

class _QuickAccessItem {
  final String label;
  final IconData icon;
  const _QuickAccessItem(this.label, this.icon);
}

class _QuickAccessCard extends StatelessWidget {
  final _QuickAccessItem item;
  const _QuickAccessCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFDF3E9),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFFF6E4E4),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  item.icon,
                  color: const Color(0xFFC0272D),
                  size: 22,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                item.label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
