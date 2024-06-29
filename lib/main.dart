import 'package:flutter/material.dart';
import 'screens/init_screen.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(const KarmaApp());
}

class KarmaApp extends StatelessWidget {
  const KarmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InitialScreen(),
      debugShowCheckedModeBanner: false,
      title: "Karma",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
