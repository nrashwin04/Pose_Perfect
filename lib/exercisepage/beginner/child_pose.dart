import 'package:flutter/material.dart';
import 'package:yoga_two/camera_test.dart';

class ChildPosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefae0),
      appBar: AppBar(
        title: const Text(
          'Demonstrations',
          style: TextStyle(
            color: Color(0xFFd4a373),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xfffefae0),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color(0xff7f5539)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0), // Round the corners of the image
                child: Image.asset(
                  "assets/beginner/gifs/child_pose.gif", // Ensure the path to your asset is correct
                  width: double.infinity,  // The GIF will now stretch to fill the available width
                  height: 400, // Adjust the height to make the GIF larger
                  fit: BoxFit.cover, // Optional: Ensures the GIF covers the space without distortion
                ),
              ),
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
            SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CameraApp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff7f5539), // Button color
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  "Try Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
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

