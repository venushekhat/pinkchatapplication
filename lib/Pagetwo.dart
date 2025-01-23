import 'package:flutter/material.dart';
import 'package:pinkchatapplication/Pagethree.dart';

class Pagetwo extends StatefulWidget {
  const Pagetwo({super.key});

  @override
  State<Pagetwo> createState() => _PageoneState();
}

class _PageoneState extends State<Pagetwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xff2a0d2e),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 150.0, left: 50),
            child: Image(
              image: AssetImage("assets/Image2.png"),
              height: 300,
              width: 500,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Column(
            children: [
              Center(
                child: Text(
                  "Schedule Conversation",
                  style: TextStyle(
                      color: Color(0XFFfa5075),
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Text(
                  "With Friends",
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
                  "Easily create an upcoming",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Center(
                child: Text(
                  "event and get ready for battle.",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Center(
                child: Text(
                  "Yeah! real combat fella.",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Pagethree(),
                        ));
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Color(0XFFfa5075),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
            height: 80,
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
