import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinkchatapplication/dashboard.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _isLoading = false;

  Future<void> loginUser(String? email, String? password) async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);

      User? user = userCredential.user;

      print(user!.uid);

      var document = await FirebaseFirestore.instance
          .collection("Data")
          .doc(user.uid)
          .get();

      print(document["username"]);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(
              user: user,
            ),
          ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill the required fields')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A0D2E),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: const Image(
              image: AssetImage("assets/login.png"),
              height: 350,
              width: 500,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Login Your's",
                    style: TextStyle(
                      color: Color(0xFFFA5075),
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  child: const Text(
                    "Hi, kindly fill in the form to proceed\ncombat",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0.0),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      child: TextField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0XFFff6480), width: 2.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0XFFff6480), width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      child: TextField(
                        controller: _passwordController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0XFFff6480), width: 2.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0XFFff6480), width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    SizedBox(
                      width: 310,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFFf84971),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: _isLoading
                            ? null
                            : () {
                                setState(() {
                                  loginUser(_emailController.text.toString(),
                                      _passwordController.text.toString());
                                });
                              },
                        child: const Text(
                          "Login !",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Back to you Ragistration?",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Ragistration",
                            style: TextStyle(
                                color: Color(0XFFf84971), fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
