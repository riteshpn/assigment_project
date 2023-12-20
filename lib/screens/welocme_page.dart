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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              color: CommonConstant.lightBlue,
              size: screenWidth * 0.25,
            ),
            const Text(
              'Apna Ghar',
              style: CommonConstant.blueheadingTextStyle,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            const Center(
              child: Column(
                children: [
                  Text(
                    'For Every Home problems we',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    'have solution',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Text('Sign Up', style: CommonConstant.black),
          ],
        ),
      ),
    );
  }
}
