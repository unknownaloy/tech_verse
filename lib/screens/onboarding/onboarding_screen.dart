import 'package:flutter/material.dart';
import 'package:tech_verse/screens/onboarding/screen_01.dart';
import 'package:tech_verse/screens/onboarding/screen_02.dart';
import 'package:tech_verse/screens/onboarding/screen_03.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  int _currentPage = 0;

  void _pageControllerListener() {
    final indexOfPage = _pageController.page?.toInt();

    if (indexOfPage != null) {
      setState(() => _currentPage = indexOfPage);
    }
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentPage);

    _pageController.addListener(_pageControllerListener);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          const Screen01(),
          const Screen02(),
          const Screen03(),
        ],
      ),
    );
  }
}

//AB9FD0
