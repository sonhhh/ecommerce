// import 'package:ecommerce/ui/pages/introl/widgets.dart';
// import 'package:flutter/material.dart';
//
// class OnboardingChildPage extends StatefulWidget {
//   const OnboardingChildPage({super.key});
//
//   @override
//   State<OnboardingChildPage> createState() => _OnboardingChildPageState();
// }
//
// class _OnboardingChildPageState extends State<OnboardingChildPage> {
//   late PageController pageViewController = PageController();
//    List<Widget> onboardingPages = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     onboardingPages = [
//       const OnboardingSubPage(
//         title: 'Travis_Scott',
//         description: "Simo",
//         image: 'assets/image/introl_1.jpeg',
//       ),
//       const OnboardingSubPage(
//         title: 'Travis_Scott',
//         description: "Simo",
//         image: 'assets/image/introl2.webp',
//       ),
//       const OnboardingSubPage(
//         title: 'Travis_Scott',
//         description: "Simo",
//         image: 'assets/image/introl3.webp',
//       ),
//     ];
//     pageViewController = PageController(initialPage: 0);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     pageViewController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//                 child: PageView.builder(
//               controller: pageViewController,
//               itemCount: onboardingPages.length,
//           itemBuilder: (context, index) => OnboardingSubPage(
//               image: onboardingPages[index].image,
//               title: onboardingPages[index].title,
//               description: onboardingPages[index].description),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
