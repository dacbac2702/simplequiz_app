// Import the material package
import 'package:flutter/material.dart';
import './screens/home_screen.dart';

// Run the main method
void main() {
  // The runApp method
  runApp(
    const MyApp(),
  );
}

// Create the MyApp widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      // Set a homepage
      home: HomeScreen(),
    );
  }
}
