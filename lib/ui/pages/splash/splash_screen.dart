import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 50),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/image/travis_scott.jpg'),
                fit: BoxFit.cover),
            color: Colors.black.withOpacity(0.1)),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
              style: ButtonStyle(
              //  elevation: MaterialStateProperty.all(0),
                overlayColor: MaterialStateProperty.all(Colors.black38),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
               //   elevation: MaterialStateProperty.all(0),
                  overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  side: MaterialStateProperty.all(const BorderSide(color: Colors.white, width: 2))
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
