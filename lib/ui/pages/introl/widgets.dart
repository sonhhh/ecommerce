import 'package:flutter/material.dart';

class OnboardingSubPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingSubPage(
      {Key? key,
        required this.title,
        required this.description,
        required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: 300,
          height: 300,
          fit: BoxFit.fill,
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 15, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}