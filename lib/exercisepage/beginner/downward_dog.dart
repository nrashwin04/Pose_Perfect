import 'package:flutter/material.dart';

class DownwardDogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff95D5B2),
      appBar: AppBar(
        title: const Text(
          'Demonstration',
          style: TextStyle(
            color: Color(0xFF1B4332),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff95D5B2),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color(0xFF1B4332)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0), // Rounds the corners of the image
                child: Image.asset(
                  "assets/beginner/gifs/downward_dog.gif", // Path to your image asset
                  width: double.infinity, // Ensures the image spans the available width
                  height: 400, // Adjust the height to make the image larger
                  fit: BoxFit.cover, // Ensures the image covers the area without distortion
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Downward Dog Pose",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 20),
              Text(
                "Downward Dog is a foundational yoga pose that stretches and strengthens the entire body. It helps to calm the mind and energize the body.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "How to Do It:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              Text(
                "- Start on your hands and knees in a tabletop position.\n"
                "- Spread your fingers wide and press your palms into the mat.\n"
                "- Tuck your toes under and lift your hips towards the ceiling.\n"
                "- Straighten your legs as much as possible while keeping a slight bend in the knees if needed.\n"
                "- Press your heels towards the floor and keep your head relaxed between your arms.\n"
                "- Hold the pose for 30 seconds to 1 minute.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Benefits:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              Text(
                "- Strengthens the arms, shoulders, and legs.\n"
                "- Stretches the hamstrings, calves, and spine.\n"
                "- Improves blood flow and energizes the body.\n"
                "- Helps relieve stress and calm the mind.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
