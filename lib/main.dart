import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'auth_service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: AuthService().handleAuthState(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              const Image(
                width: 200,
                image: AssetImage('assets/images/college_logo.png'),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the ID',
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const AnotherPage(),
              GestureDetector(
                onLongPress: () {
                  const MyApp();
                },
                child: Image.asset(
                  'assets/images/google_logo.png',
                  fit: BoxFit.cover,
                  width: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AuthService().signInWithGoogle();
      },
      child: const ElevatedButton(
        onPressed: null,
        child: Text("Login"),

      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await AuthService().signInWithGoogle();
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      },
      child: const Text("Login"),
    );
  }
}


