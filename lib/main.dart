// ignore_for_file: unused_import

import 'package:blood/view/auth_screen.dart';
import 'package:blood/view/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
