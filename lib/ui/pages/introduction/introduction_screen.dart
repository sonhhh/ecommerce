
import 'package:ecommerce/ui/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<PageViewModel> pages = [
    PageViewModel(
        title: '20% Discount \n New Arrival Product',
         body: 'Here you can have whatever description you would like to have, you can type it all in here',
        image: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Center(
            child: Image.asset('assets/introl/introl2.webp', fit: BoxFit.cover),
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: 'Take Advantage \n Of The Offer Shopping ',
        body: 'Here you can have whatever description you would like to have, you can type it all in here',
        image: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Center(
            child: Image.asset('assets/introl/introl_1.jpeg'),
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: 'All Types Offers \n Within Your Reach',
        body: 'Here you can have whatever description you would like to have, you can type it all in here',
        image: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Center(
            child: Image.asset('assets/image/travis_scott.jpg'),
          ),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(12,12),
            color: Colors.grey,
            activeSize: Size.square(15),
            activeColor: Colors.black,
          ),
          showDoneButton: true,
          done: const Icon(Icons.arrow_forward, size: 25, color: Colors.black),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward, size: 25,color: Colors.black),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }
}
void onDone(context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('ON_BOARDING', false);
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SplashScreen()));
}
