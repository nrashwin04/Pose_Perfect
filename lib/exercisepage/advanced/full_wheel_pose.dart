import 'package:flutter/material.dart';

class FullWheelPosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7b6b3),
      appBar: AppBar(
        title: const Text(
          'Demonstrations',
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
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "assets/advanced/gifs/full_wheel_pose.gif",
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Full Wheel Pose",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 20),
              Text(
                "Full Wheel Pose is an advanced backbend that opens the chest, strengthens the arms and legs, and increases spinal flexibility.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "How to Do It:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              Text(
                "- Lie on your back with your knees bent and feet flat on the floor.\n"
                "- Place your hands by your ears, fingers pointing toward your shoulders.\n"
                "- Press into your hands and feet, lifting your chest and hips off the ground.\n"
                "- Hold the pose for 15-30 seconds.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Benefits:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              Text(
                "- Strengthens the arms, legs, and spine.\n"
                "- Increases flexibility in the back and chest.\n"
                "- Stimulates the thyroid and pituitary glands.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
