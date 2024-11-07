import 'package:blood/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Connecting Lives",
      body:
          "Join a network of heroes committed to saving lives. Together, we make finding blood donors faster and easier for everyone.",
      image: Center(
        child: Image.asset('assets/connection.png', height: 175.0),
      ),
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.only(top: 100),
        imageFlex: 2,
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16),
      ),
    ),
    PageViewModel(
      title: "Find Nearby Donors Instantly",
      body:
          "Quickly locate compatible blood donors around you with our map feature, saving precious time in urgent situations.",
      image: Center(
        child: Image.asset('assets/location.png', height: 175.0),
      ),
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.only(top: 100),
        imageFlex: 2,
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16),
      ),
    ),
    PageViewModel(
      title: "Seamless Connections",
      body:
          "Directly chat with donors to coordinate faster assistance, making every life-saving connection smoother and more personal.",
      image: Center(
        child: Image.asset('assets/chat.png', height: 175.0),
      ),
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.only(top: 100),
        imageFlex: 2,
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16),
      ),
    ),
  ];

  void goToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: pages,
        onDone: () => goToHome(context),
        onSkip: () => goToHome(context), // You can skip the onboarding
        showSkipButton: true,
        skip: const Text(
          "SKIP",
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
        next: const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.red,
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
        done: const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.red,
          child:
              Text("Done", style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Colors.grey,
          activeSize: Size(22.0, 10.0),
          activeColor: Colors.red,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
