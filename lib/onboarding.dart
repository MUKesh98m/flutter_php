// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:introduction_screen/introduction_screen.dart';
//
// class onboarding extends StatefulWidget {
//   const onboarding({Key? key}) : super(key: key);
//
//   @override
//   State<onboarding> createState() => _onboardingState();
// }
//
// class _onboardingState extends State<onboarding> {
//   final List<PageViewModel> pages = [
//     PageViewModel(
//         body: "Description",
//         title: "First Page",
//         footer: ElevatedButton(onPressed: () {}, child: Text("Let's Go")),
//         image: Center(
//           child: Image.asset('asset/quality.svg'),
//         ),
//         decoration: const PageDecoration(
//           titleTextStyle: TextStyle(
//             fontSize: 25.0,
//             fontWeight: FontWeight.bold,
//           ),
//         )),
//     PageViewModel(
//         body: "Description",
//         title: "Second Page",
//         footer: ElevatedButton(onPressed: () {}, child: Text("Let's Go")),
//         image: Center(
//           child: Image.asset('asset/delevery.svg'),
//         ),
//         decoration: const PageDecoration(
//           titleTextStyle: TextStyle(
//             fontSize: 25.0,
//             fontWeight: FontWeight.bold,
//           ),
//         )),
//     PageViewModel(
//         body: "Description",
//         title: "Third Page",
//         footer: ElevatedButton(onPressed: () {}, child: Text("Let's Go")),
//         image: Center(
//           child: Image.asset('asset/reward.svg'),
//         ),
//         decoration: const PageDecoration(
//           titleTextStyle: TextStyle(
//             fontSize: 25.0,
//             fontWeight: FontWeight.bold,
//           ),
//         )),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: IntroductionScreen(
//       pages:pages,
//       dotsDecorator: const DotsDecorator(
//         size: Size(10, 10)
//       ),
//     ));
//   }
// }