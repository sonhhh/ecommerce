import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage('assets/image/travis_scott.jpg'), fit: BoxFit.cover),
          color: Colors.black.withOpacity(0.1)
        ),
      ),
    );
  }
}
