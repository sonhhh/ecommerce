import 'package:ecommerce/ui/pages/bottom_navigation_bar/bottom_bar.dart';
import 'package:flutter/material.dart';

class Successfull extends StatelessWidget {
  const Successfull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            const Icon(Icons.check_circle_outline, color: Colors.green, size: 50),
            const SizedBox(height: 10,),
            const Text('Successfull!', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
            const Text('You have successfully registered \n our app and start working in it.'),
            const SizedBox(height: 300,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomBar(),));
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  child: const Text(
                    'Start Shopping',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
