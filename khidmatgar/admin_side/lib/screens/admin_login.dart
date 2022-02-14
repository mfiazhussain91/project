import 'package:admin_side/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Admin Login",
          style: GoogleFonts.pollerOne(textStyle: TextStyle()),
          textScaleFactor: 1.0,
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 0,
        // leading: Icon(Icons.arrow_back_ios, color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            // maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery
                .of(context)
                .size
                .width,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 24.0,
                  left: 24.0,
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          "images/logo.png",
                          width: double.infinity,
                        ),
                      ),
                      // SizedBox(height: 15),
                      Center(
                        child: Text(
                          "Admin",
                          style: GoogleFonts.pollerOne(
                              textStyle: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 18,
                                  letterSpacing: 1.2)),
                          textScaleFactor: 1.3,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          "Please! login to continue",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailTextController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "Enter Your E-mail",
                            labelText: "E-mail",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey[600],
                            ),
                          ),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "This field is required"),
                            EmailValidator(
                                errorText: 'Enter a valid E-mail address'),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          obscureText: true,
                          controller: _passwordTextController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "Enter Your Password",
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey[600],
                            ),
                          ),
                          validator: RequiredValidator(
                              errorText: 'This field is required'),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      loading
                          ? Center(child: CircularProgressIndicator())
                          : GestureDetector(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.indigo,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.indigo,
                                    spreadRadius: 1,
                                    offset: Offset(1, 0),
                                    blurRadius: 8)
                              ]),
                          child: Center(
                            child: Text("Login",
                                style: GoogleFonts.knewave(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20))),
                          ),
                        ),
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                          }
                          _emailTextController.text.isNotEmpty &&
                              _passwordTextController.text.isNotEmpty
                              ? loginAdmin()
                              : showDialog(
                              context: context,
                              builder: (c) {
                                return Expanded(
                                  child: AlertDialog(
                                    title: Icon(Icons.cancel_outlined, color: Colors.red,),
                                    content: Padding(
                                      padding: const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                          'Email & Password Required',
                                        style: GoogleFonts.pollerOne(textStyle: TextStyle(fontSize: 12)),
                                        textScaleFactor: 1.0,),
                                    ),
                                    actions: [
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Ok',
                                            style: GoogleFonts.pollerOne(textStyle: TextStyle(fontSize: 14,
                                            color: Colors.indigo,
                                            )),
                                            textScaleFactor: 1.0,
                                          ))
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  loginAdmin() {
    FirebaseFirestore.instance.collection("admins").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()["email"] != _emailTextController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Your Email in not correct."),
          ));
        } else if (result.data()["password"] !=
            _passwordTextController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Your Password in not correct."),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Welcome Admin,"),
          ));
          setState(() {
            _emailTextController.text = "";
            _passwordTextController.text = "";
          });
          Route route = MaterialPageRoute(builder: (context) => HomePage());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }

  dialogfunction(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.yellow,
            child: Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: 6,
                  ),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      Colors.black,
                    ),
                  ),
                  Text("  Authenticating Please  wait ..."),
                ],
              ),
            ),
          );
        });
  }
}


