import 'package:flutter/material.dart';

class PoseDetectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff95D5B2),
      appBar: AppBar(
        title: const Text(
          'Pose Detection',
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
      body: Center(
        child: Text(
          "Camera Integration Coming Soon ....",
          style: TextStyle(fontSize: 18, fontFamily: 'Poppins',fontWeight: FontWeight.bold,color: Color(0xFF1B4332)),
        ),
      ),
    );
  }
}
