import 'package:flutter/material.dart';
import 'screens/init_screen.dart';
import 'screens/home_screen.dart';
import 'screens/registration_screen.dart';

void main() {
  runApp(const KarmaApp());
}

class KarmaApp extends StatelessWidget {
  const KarmaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/init',
      debugShowCheckedModeBanner: false,
      title: "Karma",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/init' : (context) => const InitialScreen(),
        '/registration' : (context) => const RegistrationScreen()
      },
    );
  }
}
