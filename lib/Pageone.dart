import 'package:flutter/material.dart';
import 'package:pinkchatapplication/Pagetwo.dart';

class Pageone extends StatefulWidget {
  const Pageone({super.key});

  @override
  State<Pageone> createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xff2a0d2e),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 110.0, left: 65),
            child: Image(
              image: AssetImage("assets/Image1.png"),
              height: 350,
              width: 360,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Column(
            children: [
              Center(
                child: Text(
                  "Get Paid! Conversation",
                  style: TextStyle(
                      color: Color(0XFFfa5075),
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Text(
                  "Video Call",
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
                  "Earn points and real cash when",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Center(
                child: Text(
                  "you win a battle with no delay in",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Center(
                child: Text(
                  "cashing out",
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
                          builder: (context) => const Pagetwo(),
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
            height: 90,
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
