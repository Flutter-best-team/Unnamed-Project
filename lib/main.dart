import 'package:flutter/material.dart';
import 'screens/init_screen.dart';

void main() {

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
        primarySwatch: Colors.green
      ),
    );
  }



}
