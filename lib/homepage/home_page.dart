import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_content.dart';
import '../bmicalcpage/bmicalc_page.dart';
import '../exercisepage/exercise_page.dart';
import '../profilepage/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    YogaStudio(),  // Pass a title here
    BMICalculatorPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff95D5B2),
      appBar: AppBar(
        title: const Text(
          'zenica .',
          style: TextStyle(
            color: Color(0xFF1B4332),
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff95D5B2),
        elevation: 0.0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: const Color(0xff081C15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            gap: 8,
            color: Color(0xff52B788),
            activeColor: const Color(0xffD8F3DC),
            tabBackgroundColor: Color(0xff40916C),
            padding: const EdgeInsets.all(10),
            onTabChange: _onItemTapped,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.self_improvement,
                text: 'Exercise',
              ),
              GButton(
                icon: Icons.calculate_rounded,
                text: 'BMI Calculator',
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
