import 'package:blood_donation/profile/profile.dart';
import 'package:blood_donation/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Admin/AdminDashboard.dart';
import 'Registration.dart';
import 'home.dart';

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
String email;
final auth= FirebaseAuth.instance;
  @override


  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.indigo,
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 170.0,
                    child: ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 540.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80.0,
                    left: MediaQuery.of(context).size.width - 170.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 130.0,
                          height: 130.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/Logo1.png'))),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                'Blood',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, left: 5.0),
                              child: Text(
                                'Donation',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 310.0,
                    left: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Container(
                            width: 250.0,
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Reset',
                                  hintText: 'Enter your Email',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              onChanged: (value) {
                                setState(() {
                                  email = value.trim();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 70.0,
                    left: MediaQuery.of(context).size.width - 260.0,
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      child: RaisedButton(
                        splashColor: Colors.yellow,
                        color: Colors.red,
                        padding: EdgeInsets.all(12.0),
                        shape: StadiumBorder(),
                        onPressed: () {
                          auth.sendPasswordResetEmail(email: email);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Reset',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
    );

  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 80.0);

    var firstControlPoint = new Offset(50.0, size.height);
    var firstEndPoint = new Offset(size.width / 3.5, size.height - 45.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width - 30.0, size.height / 2);

    var secondControlPoint =
        new Offset(size.width + 15.0, size.height / 2 - 60.0);
    var secondEndPoint = new Offset(140.0, 50.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = new Offset(50.0, 0.0);
    var thirdEndPoint = new Offset(0.0, 100.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
