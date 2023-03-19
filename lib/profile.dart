import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    String? Email = user?.email;
    String? photourl = user?.photoURL;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Data"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                AuthService().signOut();
              },
              icon: const Icon(Icons.adb_rounded),
            )
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(photourl!),
                maxRadius: 100,
              ),
              Text(Email!),
              SelectableText(snapshot1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      Text("Name"),
                      Text("Email"),
                      Text("Roll no."),
                      Text("PRN"),
                      Text("Division"),
                      Text("Batch"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
