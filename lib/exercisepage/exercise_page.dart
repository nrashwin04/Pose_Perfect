import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise App',
      theme: ThemeData(
        primaryColor: Colors.green,
        highlightColor: Colors.greenAccent,
      ),
      home: ExerciseHomePage(),
    );
  }
}

class ExerciseHomePage extends StatelessWidget {
  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff95D5B2),
      appBar: AppBar(
        backgroundColor: Color(0xff95D5B2),
        title: const Text(
          'Exercise',
          style: TextStyle(
            color: Color(0xFF1B4332),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Reduce padding to fill space
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.75, // Adjust aspect ratio for card height
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: [
            ExerciseCard(
              title: 'Yoga',
              imagePath: 'assets/yoga.jpg', // Add your image asset path
              onTap: () => navigateTo(context, YogaPosesPage()),
            ),
            ExerciseCard(
              title: 'Meditation',
              imagePath: 'assets/meditation.jpg',
              onTap: () => navigateTo(context, MeditationPage()),
            ),
            ExerciseCard(
              title: 'Diet Recommendation',
              imagePath: 'assets/diet.jpg',
              onTap: () => navigateTo(context, DietRecommendationPage()),
            ),
            ExerciseCard(
              title: 'Tips',
              imagePath: 'assets/tips.jpg',
              onTap: () => navigateTo(context, TipsPage()),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  ExerciseCard({required this.title, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), // Increase radius for more curvature
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              // Overlay with Title Text
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder pages
class YogaPosesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Yoga Poses')), body: Center(child: Text('Yoga Poses Page')));
  }
}

class MeditationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Meditation')), body: Center(child: Text('Meditation Page')));
  }
}

class DietRecommendationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Diet Recommendation')), body: Center(child: Text('Diet Recommendation Page')));
  }
}

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Tips')), body: Center(child: Text('Tips Page')));
  }
}
