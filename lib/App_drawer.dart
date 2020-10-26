import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './MyAccount.dart';

class Appdrawer extends StatelessWidget {
  List wishList = [];
  List cartList = [];
  Appdrawer({wishList, cartList});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text("Esmart"),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/HomeScreen', arguments: false);
          },
          title: Text("Home"),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/HomeScreen', arguments: true);
          },
          title: Text("WishList"),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/OrderScreen');
          },
          title: Text("Order"),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext ctx) => MyAccount()));
          },
          title: Text("Edit Profile"),
        ),
        ListTile(
          onTap: () {
            FirebaseAuth.instance.signOut().then(
                (value) => Navigator.pushReplacementNamed(context, '/login'));
          },
          title: Text("Log Out"),
        )
      ],
    );
  }
}
