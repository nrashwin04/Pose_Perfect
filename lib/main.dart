import 'package:flutter/material.dart';
import 'package:yoga_two/homepage/home_page.dart';
import 'package:yoga_two/loginpage/auth_page.dart';
import 'package:yoga_two/profilepage/profile_page.dart';
import 'loginpage/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const YogaLoginApp());
}

class YogaLoginApp extends StatelessWidget {
  const YogaLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/home': (context) => HomePage()
      },
    );
  }
}