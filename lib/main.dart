import 'package:blood/view/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Blood());
}

class Blood extends StatelessWidget {
  const Blood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: OnboardingScreen());
  }
}
