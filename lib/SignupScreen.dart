import 'package:flutter/material.dart';
import './Curvepainter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignupScreen extends StatelessWidget {
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
                  "Get on Board",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(
                height: 100,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                controller: email,
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  try {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email.text, password: password.text);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("Sign Up"),
              ),
              FlatButton(
                onPressed: () {},
                child: Text("I am already a member"),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
