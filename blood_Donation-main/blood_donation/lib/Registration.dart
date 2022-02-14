import 'package:blood_donation/loginScreen.dart';
import 'package:blood_donation/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isRequesting = false;

  TextEditingController Username = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController BloodGroup = TextEditingController();
  TextEditingController Gender = TextEditingController();
  bool isLoading = false;
  signUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      await AuthService().signUp(Email.text, Password.text).whenComplete(() {
        ref.add({
          'Username': Username.text,
          'Email': Email.text,
          'Password': Password.text,
          'BloodGroup': BloodGroup.text,
          'Gender': Gender.text,
        }).then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      });
    }
  }

  CollectionReference ref = FirebaseFirestore.instance.collection('Users');

  var confirmPass;
  ScrollController _scrollController = ScrollController();
  @override
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

                    top: 20.0,
                    child: ClipPath(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 600.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.7),
                                  BlendMode.dstATop),
                              image: AssetImage("assets/Blood.jpg"),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                    ),
                  ),
                  Positioned(

                    top: 25.0,
                    left: 40.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sign up to continue',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18.0),
                        ),
                        Form(
                          key: _formKey,
                          child: Container(

                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Container(
                                    width: 250.0,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'What is your sweet name?';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          fillColor:
                                              Colors.white.withOpacity(0.6),
                                          filled: true,
                                          labelText: 'Username',
                                          hintText: 'Enter your username',
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          prefixIcon: Icon(
                                            Icons.account_circle,
                                            color: Colors.black,
                                          ),
                                          errorStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                      controller: Username,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Container(
                                    width: 250.0,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter email like :example@gmail.com';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          fillColor:
                                              Colors.white.withOpacity(0.6),
                                          filled: true,
                                          labelText: 'Email',
                                          hintText: 'example@gmail.com',
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          prefixIcon: Icon(
                                            Icons.email_rounded,
                                            color: Colors.black,
                                          ),
                                          errorStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                      controller: Email,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    width: 250.0,
                                    child: TextFormField(
                                      validator: (String value) {
                                        confirmPass = value;
                                        if (value.isEmpty) {
                                          return "Please Enter New Password";
                                        } else if (value.length < 8) {
                                          return "Password must be atleast 8 characters long";
                                        } else {
                                          return null;
                                        }
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          fillColor:
                                              Colors.white.withOpacity(0.6),
                                          filled: true,
                                          labelText: 'Password',
                                          hintText: 'Enter your password',
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          prefixIcon: Icon(
                                            Icons.security,
                                            color: Colors.black,
                                          ),
                                          errorStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                      controller: Password,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    width: 250.0,
                                    child: TextFormField(
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Please Re-Enter New Password";
                                        } else if (value.length < 8) {
                                          return "Password must be atleast 8 characters long";
                                        } else if (value != confirmPass) {
                                          return "Password must be same as above";
                                        } else {
                                          return null;
                                        }
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          fillColor:
                                              Colors.white.withOpacity(0.6),
                                          filled: true,
                                          labelText: 'Confirm Password',
                                          hintText:
                                              'Enter your Confirm Password',
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          prefixIcon: Icon(
                                            Icons.security,
                                            color: Colors.black,
                                          ),
                                          errorStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0))),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    width: 250.0,
                                    child: DropdownButtonFormField(
                                      validator: (value) => value == null
                                          ? 'Please provide Blood Group'
                                          : null,
                                      style: new TextStyle(
                                        color: Colors.black,
                                      ),
                                      onChanged: (val) {
                                        BloodGroup.text = val;
                                      },
                                      decoration: InputDecoration(
                                          fillColor:
                                              Colors.white.withOpacity(0.6),
                                          filled: true,
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          prefixIcon: Icon(
                                            IconData(61138,
                                                fontFamily: 'MaterialIcons'),
                                            color: Colors.black,
                                          ),
                                          errorStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      hint: Text("Blood Group"),
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("A+"),
                                          value: "A+",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("B+"),
                                          value: "B+",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("O+"),
                                          value: "O+",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("AB+"),
                                          value: "AB+",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("A-"),
                                          value: "A-",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("B-"),
                                          value: "B-",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("O-"),
                                          value: "O-",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("AB-"),
                                          value: "AB-",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    width: 250.0,
                                    child: DropdownButtonFormField(
                                      validator: (value) => value == null
                                          ? 'Please provide Gender'
                                          : null,
                                      onChanged: (val) {
                                        Gender.text = val;
                                      },
                                      decoration: InputDecoration(
                                          fillColor:
                                              Colors.white.withOpacity(0.6),
                                          filled: true,
                                          prefixIcon: Icon(
                                            Icons.people_sharp,
                                            color: Colors.black,
                                          ),
                                          errorStyle:
                                              TextStyle(color: Colors.black),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          )),
                                      hint: Text("Choose your Sex"),
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("Male"),
                                          value: "Male",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("Female"),
                                          value: "Female",
                                        ),
                                        DropdownMenuItem(
                                          child: Text("Other"),
                                          value: "Other",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 + 277.0,
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
                          signUp();
                          // if (_formKey.currentState.validate()) {
                          //   if (_formKey.currentState.validate()) {
                          //     ref.add({
                          //       'Username': Username.text,
                          //       'Email': Email.text,
                          //       'Password': Password.text,
                          //       'BloodGroup': BloodGroup.text,
                          //       'Gender': Gender.text,
                          //
                          //     });
                          //  //   handleBloodRequest();
                          //   }
                          //
                          // }
                        },
                        child: Text(
                          'Registration',
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
