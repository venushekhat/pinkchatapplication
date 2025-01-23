import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinkchatapplication/singinscreen.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String? profilePic =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuIrxjcch20R2L6Mwq2SEJttIDE2BgHJFOTCBmX9rlCfHJU80gbDJtaaUlXh9WeW81nZg&usqp=CAU";
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> registerUser(
      String? username, String? email, String? password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);

      User? user = userCredential.user;

      FirebaseFirestore.instance.collection("Data").doc(user!.uid).set(
          {"email": email, "username": username, "profilePic": profilePic});

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Signin()));
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text("Please enter valid data"),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Registration Form"),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(10),
    //     child: Column(
    //       children: [
    //         TextField(
    //           controller: _usernameController,
    //           decoration: InputDecoration(
    //             hintText: "Enter Your Username",
    //             label: const Text("Username"),
    //             border:
    //                 OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         TextField(
    //           controller: _emailController,
    //           decoration: InputDecoration(
    //             hintText: "Enter Your Email",
    //             label: const Text("Email"),
    //             border:
    //                 OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         TextField(
    //           obscureText: true,
    //           controller: _passwordController,
    //           decoration: InputDecoration(
    //             hintText: "Enter Your Password",
    //             label: const Text("Password"),
    //             border:
    //                 OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         ElevatedButton(
    //             onPressed: () {
    //               setState(() {
    //                 registerUser(
    //                     _usernameController.text.toString(),
    //                     _emailController.text.toString(),
    //                     _passwordController.text.toString());
    //               });
    //             },
    //             child: const Text("Submit")),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         InkWell(
    //           onTap: () {
    //             Navigator.push(context,
    //                 MaterialPageRoute(builder: (context) => const Signin()));
    //           },
    //           child: const Text("Click here if already registered"),
    //         )
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: const Color(0xFF2A0D2E),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: const Image(
              image: AssetImage("assets/ragistration.png"),
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
                    "Registration Your's",
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
                      child: TextField(
                        controller: _usernameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          prefixIcon: Icon(
                            Icons.person,
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signin(),
                            ),
                          );
                        },
                        child: const Text(
                          "Ragistration !",
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
                            "Already have an account?",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Login",
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
