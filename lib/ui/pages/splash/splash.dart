import 'package:ecommerce/ui/pages/introduction/introduction_screen.dart';
import 'package:ecommerce/ui/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final bool showOnboarding;

  const Splash({super.key, required this.showOnboarding});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(
        const Duration(seconds: 4));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) =>
          widget.showOnboarding ? const IntroScreen() : const SplashScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/image/travis_scott.jpg'),
                fit: BoxFit.cover),
            color: Colors.black.withOpacity(0.1)),
      ),
    );
  }
}
