import 'package:flutter/material.dart';
import 'package:pinkchatapplication/ragistrationscreen.dart';

class Pagethree extends StatefulWidget {
  const Pagethree({super.key});

  @override
  State<Pagethree> createState() => _PageoneState();
}

class _PageoneState extends State<Pagethree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xff2a0d2e),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 120.0, left: 40),
            child: Image(
              image: AssetImage("assets/Image3.png"),
              height: 350,
              width: 500,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Column(
            children: [
              Center(
                child: Text(
                  "Text, Audio and",
                  style: TextStyle(
                      color: Color(0XFFfa5075),
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Text(
                  "Video Chat",
                  style: TextStyle(
                      color: Color(0XFFfa5075),
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          const Column(
            children: [
              Center(
                child: Text(
                  "Intuitive real life experience on",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Center(
                child: Text(
                  "mobile. Chat with fellow gamers",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Center(
                child: Text(
                  "before and after combat for",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Center(
                child: Text(
                  "free!",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  width: 290, // Set desired width
                  height: 60, // Set desired height
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0XFFf84971), // Pink color for the button
                      foregroundColor: Colors.white, // White text color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Border radius
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Registration(),
                        ),
                      );
                    },
                    child: const Text(
                      "Let's Combat!",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0),
                  height: 1.5,
                  width: 35,
                  color: const Color(0XFFfa5075),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0XFFfa5075),
                  radius: 5.0,
                ),
                SizedBox(width: 8.0),
                CircleAvatar(
                  backgroundColor: Color(0XFF722447),
                  radius: 5.0,
                ),
                SizedBox(width: 8.0),
                CircleAvatar(
                  backgroundColor: Color(0XFF722447),
                  radius: 5.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
