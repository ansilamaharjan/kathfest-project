import 'package:flutter/material.dart';
import 'screens/homepage.dart';
// import 'screens/contact.dart'; // Only use this when testing ContactScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Aid App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // Change this when testing different pages
      home: const HomeScreen(),
      // home: const ContactScreen(),
    );
  }
}
