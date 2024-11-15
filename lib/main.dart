import 'package:flutter/material.dart';
import 'loginpage/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/': (context) => const YogaLoginPage(),
        '/home': (context) => YogaLoginPage(),
      },
    );
  }
}
