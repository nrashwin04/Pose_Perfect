import 'package:flutter/material.dart';

class ChildPosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff95D5B2),
      appBar: AppBar(
        title: const Text(
          'Demonstrationas',
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
              Image.asset("assets/beginner/gifs/child_pose.gif"), // Ensure this asset exists in your project
              SizedBox(height: 20),
              Text(
                "Child's Pose",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 20),
              Text(
                "Child's Pose is a gentle resting pose that stretches the back, hips, and legs while calming the mind. It's often used as a resting position during yoga sessions.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "How to Do It:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              Text(
                "- Kneel on the floor with your toes touching and knees spread apart.\n"
                "- Sit back on your heels and stretch your arms forward.\n"
                "- Lower your forehead to the ground.\n"
                "- Relax your body and hold the pose for 1-2 minutes.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Benefits:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              Text(
                "- Relieves stress and tension in the body.\n"
                "- Stretches the lower back and hips.\n"
                "- Improves flexibility in the thighs and knees.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
