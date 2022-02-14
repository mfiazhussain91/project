import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:smarttailor/Provider/Female_Suit_Prices.dart';
import 'package:smarttailor/Provider/Man_suit_prises_provider.dart';
import 'package:smarttailor/buttonwidget/loginregisterbutton.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/logintextformfield/textformfieldfordescriptionbox.dart';
import 'package:smarttailor/tailorscreens/2__loginscree.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final genderEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();
  final shopNameEditingController = TextEditingController();
  final addressEditingController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var _value = 0;
  File? selectedImage;
  final picker = ImagePicker();
  late MenPricesProvider _maleProvider;
  late FemalePricesProvider _femaleProvider;

  // Pick Image
  pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    // ignore: unnecessary_null_comparison
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  // Register User
  RegisterUser() async {
    if (formKey.currentState!.validate() && selectedImage != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Row(
                children: [
                  new CircularProgressIndicator(),
                  SizedBox(
                    width: 25.0,
                  ),
                  new Text("Loading, Please wait"),
                ],
              ),
            ),
          );
        },
      );

      /// uploading image to firebase storage
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("UserImages")
          .child("${randomAlphaNumeric(9)}.jpg");
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      task.whenComplete(() async {
        try {
          var downloadURL = await firebaseStorageRef.getDownloadURL();
          print("this is url $downloadURL");

          /// Add Data to Firestore
          UserCredential result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailEditingController.text,
                  password: passwordEditingController.text);
          User? user = result.user;

          _firestore
              .collection("UserRecord")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
            "FirstName": firstNameEditingController.text,
            "LastName": lastNameEditingController.text,
            "Email": emailEditingController.text,
            "Gender": _value,
            "userImage": downloadURL,
            "phone": phoneNumberEditingController.text,
            "Address": addressEditingController.text,
            "ShopName":shopNameEditingController.text,
            "userUid": user!.uid,
          }).then((value) {
            _maleProvider.addPrices();
            _femaleProvider.addPrices();
            user.sendEmailVerification();
          });

          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TailorLoginScreen(),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Registered Successfully. Please Login.. check your email for verification",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        } on FirebaseAuthException catch (e) {
          Navigator.of(context).pop();
          if (e.code == 'weak-password') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  "Password Provided is too Weak",
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            );
          } else if (e.code == 'email-already-in-use') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  "Account Already exists",
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            );
          }
        }
      });
    }
  }

  Widget buildTopPart() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: firstNameEditingController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "First Name",
                hintStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(Icons.drive_file_rename_outline),
                border: UnderlineInputBorder(),

              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter First Name';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: lastNameEditingController,
              style: TextStyle(color: Colors.black),

              decoration: InputDecoration(
                hintText: "Last Name",
                hintStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(Icons.drive_file_rename_outline),
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Last Name';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: emailEditingController,
              style: TextStyle(color: Colors.black),
              // obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(Icons.email),
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Email';
                } else if (!value.contains('@')) {
                  return 'Please Enter Valid Email';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: passwordEditingController,
              style: TextStyle(color: Colors.black),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter password",
                hintStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(Icons.password_outlined),
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.length<6) {
                  return 'Please Enter 6+ number Password';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Gender",
                style: GoogleFonts.pollerOne(
                  textStyle: TextStyle(color: AppColors.coralColor, fontSize: 14),
                ),
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value as int;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Text("Male",
                      style: GoogleFonts.galada(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14))),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value as int;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Text("Female",
                      style: GoogleFonts.galada(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 14))),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: phoneNumberEditingController,
              style: TextStyle(color: Colors.black),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Phone-No",
                hintStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(Icons.phone_android_rounded),
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.length<11) {
                  return 'Enter Valid Phone Number';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: shopNameEditingController,
              style: TextStyle(color: Colors.black),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Shop Name",
                hintStyle: TextStyle(color: Colors.black54),
                prefixIcon: Icon(Icons.shopping_basket),
                border: UnderlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Shop Name';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 12),
          AddressTextFormField(
            address: addressEditingController,
            hintText: "Address",
            obscureText: false,
            maxLines: 4,

          ),
          SizedBox(height: 15),
          GestureDetector(
              onTap: () {
                RegisterUser();
              },
              child: TailorRegisterButton()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
      _maleProvider=Provider.of(context);
      _femaleProvider=Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Tailor Registration",
              style: GoogleFonts.pollerOne(
                textStyle: TextStyle(color: AppColors.coralColor, fontSize: 14),
              ),
              textScaleFactor: 1.5,
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
              onTap: () {
                pickImage();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.eigengrauColor,
                child: selectedImage != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(selectedImage!),
                        radius: 45,
                        backgroundColor: Colors.white,
                      )
                    : CircleAvatar(
                        radius: 50,
                        // backgroundImage: ExactAssetImage("assets/images/tail.png"),
                        backgroundColor: AppColors.eigengrauColor,
                        child: Icon(
                          Icons.add_photo_alternate_outlined,
                          color: AppColors.coralColor,
                          size: 30,
                        ),
                      ),
              )),
          SizedBox(height: 20),
          buildTopPart(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
