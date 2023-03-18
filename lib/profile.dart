import 'package:flutter/material.dart';
import 'auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Data"),
          actions: <Widget>[
            Text("Data"),
            IconButton(
              onPressed:null,
              icon: Icon(Icons.adb_rounded),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const SignOutButton(),
              SelectableText(snapshot1),
            ],
          ),
        ),
      ),
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: () {
        AuthService().signOut();
      },
      child: const Text("Logout"),
    );
  }
}
