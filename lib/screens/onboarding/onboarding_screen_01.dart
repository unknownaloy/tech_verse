import 'package:flutter/material.dart';

class OnboardingScreen01 extends StatelessWidget {
  const OnboardingScreen01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Colors.red,
          ),
          Container(color: Colors.greenAccent,),
          Container(color: Colors.indigo,),
        ],
      ),
    );
  }
}
