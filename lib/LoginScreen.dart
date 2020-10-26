import 'package:e_smart/HomeScreen.dart';
import 'package:flutter/material.dart';
import './Curvepainter.dart';
import './SignupScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: CustomPaint(
        painter: CurvePainter(),
        child: Container(
          margin: EdgeInsets.fromLTRB(25, 5, 25, 0),
          child: Column(
            children: [
              SizedBox(
                height: 140,
              ),
              Align(
                child: Text(
                  "Hello there,\nwelcome back",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email.text, password: password.text);
                    if (userCredential.user.uid ==
                        FirebaseAuth.instance.currentUser.uid) {
                      Navigator.pushNamed(context, '/HomeScreen',
                          arguments: false);
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                },
                child: Text("Login"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new SignupScreen()));
                },
                child: Text("New here? SignUp instead"),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
