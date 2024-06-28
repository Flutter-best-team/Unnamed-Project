import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        decoration: BoxDecoration(
          gradient: LinearGradient (
            colors: [Colors.green.shade700, Colors.green.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Karma!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20),
            const Text(
              "With us you could not only track your habits, but live freely: without drinking or smoking!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  backgroundColor: Colors.orange
                ),
                child: const Text(
                  "Begin new life",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

}