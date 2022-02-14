import 'package:blood_donation/profile/profile.dart';
import 'package:blood_donation/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Admin/AdminDashboard.dart';
import 'Registration.dart';
import 'Reset.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Sign In Function
  signIn() async {
    if (email == 'chairmanar001@gmail.com' || email == 'testadmin@gmail.com') {
      setState(() {
        isLoading = true;
      });
      await AuthService().signIn(email, password).then((value) {
        if (value != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminPanel()));
        } else {
          print('Wrong Email or Password');
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      });
    } else {
      setState(() {
        isLoading = true;
      });
      await AuthService().signIn(email, password).then((value) {
        if (value != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashboardPage()));
        } else {
          print('Wrong Email or Password !!');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      });
    }
  }

  @override
  bool isLoading = false;
  String email = "";
  String password = "";
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.indigo,
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 200.0,
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
                    top: 290.0,
                    left: 40.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome to',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                'Blood',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 4.0, left: 5.0),
                              child: Text(
                                'Donation',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 27.0),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Please sign in to continue',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Container(
                            width: 250.0,
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Username',
                                  hintText: 'Enter your username',
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
                                  email = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            width: 250.0,
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  prefixIcon: Icon(
                                    Icons.security,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 75.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Registration(),
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                        fontSize: 18.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: TextButton(
                                  child: Text('Forgot Password?'),
                                  onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => Reset()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 180.0,
                    left: MediaQuery.of(context).size.width - 250.0,
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      child: RaisedButton(
                        splashColor: Colors.yellow,
                        color: Colors.red,
                        padding: EdgeInsets.all(12.0),
                        shape: StadiumBorder(),
                        onPressed: () {
                          signIn();
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
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
