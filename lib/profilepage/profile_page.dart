import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if the user is logged in
    final user = FirebaseAuth.instance.currentUser;
    
    if (user == null) {
      // If no user is logged in, navigate to the login page
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login'); // Navigate to the login page
            },
            child: const Text('Please login first'),
          ),
        ),
      );
    }

    // If the user is logged in, show the profile page
    return Scaffold(
      backgroundColor: const Color(0xfff3d0c3), // Same background as the rest of the app
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with actual profile image
              ),
            ),
            const SizedBox(height: 20.0),

            // Username Section
            const Center(
              child: Text(
                'Group 13', // Example username
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B4332),
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: Text(
                'Email: ' + user.email!, // Example email
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1B4332),
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            // Sign Out Button
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut(); // Sign out the user
                  Navigator.pushReplacementNamed(context, '/login'); // Navigate to the login page
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
