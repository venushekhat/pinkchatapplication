import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pinkchatapplication/Pageone.dart';
import 'package:pinkchatapplication/Pagethree.dart';
import 'package:pinkchatapplication/Pagetwo.dart';
import 'package:pinkchatapplication/SplashScreen.dart';
import 'package:pinkchatapplication/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class HorizontalPageView extends StatelessWidget {
  const HorizontalPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: const [
          Pageone(),
          Pagetwo(),
          Pagethree(),
        ],
      ),
    );
  }
}
