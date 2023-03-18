import 'package:flutter/material.dart';
import 'auth_service.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Places"),
          toolbarOpacity: double.minPositive,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const SignOutButton(),
              Text(snapshot1),
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
