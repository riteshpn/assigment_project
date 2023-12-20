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
            const Text(
              'Sign Up',
              style: CommonConstant.black,
            ),
            const Text(
              'Continue With Mail',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Container(
              height: screenHeight * 0.09,
              width: screenWidth * 0.8,
              decoration: BoxDecoration(
                color: CommonConstant.lightBlue,
                borderRadius: BorderRadius.circular(screenWidth * 0.1),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: screenWidth * 0.04,
                    child: Center(
                      child: Container(
                        height: screenHeight * 0.06,
                        width: screenHeight * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.06),
                        ),
                        child: const Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Countinue with Mail',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              height: screenHeight * 0.07,
              width: screenWidth * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight * 0.08),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: const Center(
                child: Text('Sign As Guest'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
