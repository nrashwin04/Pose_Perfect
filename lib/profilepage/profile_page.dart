import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff95D5B2),  // Same background as the rest of the app
      appBar: AppBar(
        title: const Text(
          'Profile',
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
        iconTheme: const IconThemeData(color: Color(0xFF081C15)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile_pic.png'), // Replace with actual profile image
              ),
            ),
            const SizedBox(height: 20.0),

            // Username Section
            const Center(
              child: Text(
                'Group 13',  // Example username
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B4332),
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            const Center(
              child: Text(
                'yogajohn@example.com',  // Example email
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1B4332),
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // Completed Sessions Section
            

            // Edit Profile Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic for editing profile goes here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF081C15), // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffD8F3DC),
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
