import 'package:flutter/material.dart';

class Warrior3PosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff95D5B2),
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
                  "assets/intermediate/gifs/warrior3_pose.gif",
                  width: double.infinity,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Warrior 3 Pose",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 20),
              Text(
                "Warrior 3 Pose is a standing balance pose that strengthens the legs, core, and back, while improving focus and stability.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "How to Do It:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              Text(
                "- Start in a standing position with your feet together.\n"
                "- Shift your weight onto one leg and extend the other leg behind you.\n"
                "- Reach your arms forward, keeping your body in a straight line.\n"
                "- Hold the pose for 15-30 seconds, then switch sides.",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                "Benefits:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 10),
              Text(
                "- Strengthens the legs, core, and back.\n"
                "- Improves balance and stability.\n"
                "- Enhances focus and concentration.",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
