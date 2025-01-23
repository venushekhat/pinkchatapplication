// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pinkchatapplication/Profilescreeen.dart';
// import 'package:pinkchatapplication/messagescree.dart';
// import 'package:pinkchatapplication/singinscreen.dart';

// class Dashboard extends StatefulWidget {
//   User? user;
//   Dashboard({super.key, required this.user});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   String? username;

//   final TextEditingController _searchController = TextEditingController();

//   List<DocumentSnapshot>? allUsers;
//   List<DocumentSnapshot>? filteredUsers;

//   Future<void> fetchDataInfo() async {
//     var document = await FirebaseFirestore.instance
//         .collection("Data")
//         .doc(widget.user!.uid)
//         .get();
//     setState(() {
//       username = document["username"];
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchDataInfo();
//   }

//   void searchData(String keyword) {
//     setState(() {
//       if (keyword.isEmpty) {
//         filteredUsers = allUsers!;
//       } else {
//         filteredUsers = allUsers!
//             .where((user) =>
//                 user["username"].toLowerCase().contains(keyword.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Welcome $username"),
//         actions: [
//           PopupMenuButton<String>(
//             icon: const Icon(Icons.more_vert),
//             onSelected: (String value) {
//               if (value == "Profile") {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             ProfileScreen(user: widget.user)));
//               } else if (value == "Logout") {
//                 FirebaseAuth.instance.signOut();
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const Signin(),
//                     ));
//               }
//             },
//             itemBuilder: (context) {
//               return [
//                 const PopupMenuItem(value: "Profile", child: Text("Profile")),
//                 const PopupMenuItem(value: "Logout", child: Text("Logout")),
//               ];
//             },
//           )
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 90,
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: TextField(
//                 controller: _searchController,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     prefixIcon: const Icon(Icons.search),
//                     hintText: "Search"),
//                 onChanged: (value) {
//                   searchData(value);
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//               child: StreamBuilder(
//             stream: FirebaseFirestore.instance.collection("Data").snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 // allUsers = snapshot.data!.docs.toList();
//                 allUsers = snapshot.data!.docs
//                     .where((element) => element.id != widget.user)
//                     .toList();

//                 filteredUsers ??= List.from(allUsers!);
//                 print(filteredUsers);

//                 return ListView.builder(
//                   itemCount: filteredUsers!.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MessegeScreen(
//                                     userSnapshot: filteredUsers![index]),
//                               ));
//                         },
//                         child: Card(
//                           child: Row(
//                             children: [
//                               CircleAvatar(
//                                 child: Image.network(
//                                     "${filteredUsers![index]["profilePic"]}"),
//                               ),
//                               const SizedBox(
//                                 width: 30,
//                               ),
//                               Text("${filteredUsers![index]["username"]}"),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }
//               return const Center(child: CircularProgressIndicator());
//             },
//           ))
//         ],
//       ),
//     );
//   }
// }
//imports packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinkchatapplication/Profilescreeen.dart';
import 'package:pinkchatapplication/messagescree.dart';
import 'package:pinkchatapplication/singinscreen.dart';

class Dashboard extends StatefulWidget {
  User? user;
  Dashboard({super.key, required this.user});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? username;

  final TextEditingController _searchController = TextEditingController();

  List<DocumentSnapshot>? allUsers;
  List<DocumentSnapshot>? filteredUsers;

  Future<void> fetchDataInfo() async {
    var document = await FirebaseFirestore.instance
        .collection("Data")
        .doc(widget.user!.uid)
        .get();
    setState(() {
      username = document["username"];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataInfo();
  }

  void searchData(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        filteredUsers = allUsers!;
      } else {
        filteredUsers = allUsers!
            .where((user) =>
                user["username"].toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A0D2E),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Welcome $username",
            style: const TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 28),
          ),
        ),
        backgroundColor: const Color(0xFF2A0D2E),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (String value) {
              if (value == "Profile") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfileScreen(user: widget.user)));
              } else if (value == "Logout") {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Signin(),
                    ));
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                    value: "Profile",
                    child:
                        Text("Profile", style: TextStyle(color: Colors.black))),
                const PopupMenuItem(
                    value: "Logout",
                    child:
                        Text("Logout", style: TextStyle(color: Colors.black))),
              ];
            },
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF2A0D2E),
          // gradient: LinearGradient(
          //   colors: [Colors.pink, Colors.purple],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFFA5075).withOpacity(0.9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28,
                      ),
                      hintText: "Search",
                      hintStyle:
                          const TextStyle(color: Colors.white, fontSize: 22)),
                  onChanged: (value) {
                    searchData(value);
                  },
                ),
              ),
            ),
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("Data").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  allUsers = snapshot.data!.docs
                      .where((element) => element.id != widget.user)
                      .toList();

                  filteredUsers ??= List.from(allUsers!);

                  return ListView.builder(
                    itemCount: filteredUsers!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MessegeScreen(
                                      userSnapshot: filteredUsers![index]),
                                ));
                          },
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        "${filteredUsers![index]["profilePic"]}"),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "${filteredUsers![index]["username"]}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ))
          ],
        ),
      ),
    );
  }
}
