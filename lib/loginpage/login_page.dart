import 'package:flutter/material.dart';
import 'package:yoga_two/homepage/home_page.dart';
import 'login_button.dart';
import 'failure_dialog.dart';

class YogaLoginPage extends StatefulWidget {
  const YogaLoginPage({super.key});

  @override
  _YogaLoginPageState createState() => _YogaLoginPageState();
}

class _YogaLoginPageState extends State<YogaLoginPage> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String userId = _userIdController.text;
    String password = _passwordController.text;

    // Simple authentication check
    if (userId == 'admin' && password == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage()),
      );
    } else {
      _showFailureMessage();
    }
  }

  void _showFailureMessage() {
    showDialog(
      context: context,
      builder: (context) => const FailureDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff95D5B2),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/poseperfect.png',
              width: 100,
              height: 100,
            ),
            const Text(
              'Pose Perfect',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color(0xff1B4332),
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 40),
            // Email field
            TextField(
              controller: _userIdController,
              decoration: InputDecoration(
                hintText: 'Enter email id',
                filled: true,
                fillColor: const Color(0xffB7E4C7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Password field
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter password',
                filled: true,
                fillColor: const Color(0xffB7E4C7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Login Button
            LoginButton(onPressed: _login),
            const SizedBox(height: 20),
            // Create Account Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Not registered yet?",
                  style: TextStyle(color: Color(0xff1B4332), fontSize: 16),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Color(0xff2D6A4F), fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
