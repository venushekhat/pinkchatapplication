import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinkchatapplication/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HorizontalPageView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0XFFfd5a7b),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centers the first image
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // First image: Logo, centered in the column
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 250.0),
              child: Image(
                image: AssetImage("assets/Logo.png"),
                height: 150,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment
                  .bottomCenter, // Aligns the second image to the bottom
              child: Image(
                image: const AssetImage("assets/Graphics.png"),
                width: screenWidth, // Set width to full screen width
                fit: BoxFit.cover, // Ensures the image covers the screen width
              ),
            ),
          ),
        ],
      ),
    );
  }
}
