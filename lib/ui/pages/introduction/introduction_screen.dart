import 'package:ecommerce/ui/pages/bottom_navigation_bar/bottom_bar.dart';
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
        // footer: SizedBox(
        //   height: 45,
        //   width: 300,
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.green,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(20)
        //         ),
        //         elevation: 8
        //     ),
        //     onPressed: () {},
        //     child: const Text("Let's Go", style: TextStyle(fontSize: 20)),
        //   ),
       // ),
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
        // footer: SizedBox(
        //   height: 45,
        //   width: 300,
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.green,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(20)
        //         ),
        //         elevation: 8
        //     ),
        //     onPressed: () {},
        //     child: const Text("Why to wait!", style: TextStyle(fontSize: 20)),
        //   ),
        // ),
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
        // footer: SizedBox(
        //   height: 45,
        //   width: 300,
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.green,
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(20)
        //         ),
        //         elevation: 8
        //     ),
        //     onPressed: () {},
        //     child: const Text("Let's Start", style: TextStyle(fontSize: 20)),
        //   ),
        // ),
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
            size: Size(15,15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Icon(Icons.arrow_forward, size: 25,),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward, size: 25,),
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
