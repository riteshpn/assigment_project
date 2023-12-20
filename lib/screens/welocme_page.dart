import 'package:assigment_project/constant/colors.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    CommonConstant.setMediaQuery(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              color: CommonConstant.lightBlue,
              size: CommonConstant.screenWidth! * 0.25,
            ),
            const Text(
              'Apna Ghar',
              style: CommonConstant.blueheadingTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
