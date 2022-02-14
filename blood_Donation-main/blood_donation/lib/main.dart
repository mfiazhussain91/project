import 'package:blood_donation/Registration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:blood_donation/loginScreen.dart';
import 'package:blood_donation/home.dart';
import 'package:blood_donation/profile/profile.dart';
import 'package:blood_donation/splash/splashScreen.dart';
import 'package:blood_donation/donate.dart';
import 'Admin/AdminDashboard.dart';
import 'Admin/Donars.dart';
import 'Admin/userbloodrequest.dart';
import 'blood_requests.dart';
import 'Registration.dart';
import 'package:blood_donation/Donars.dart';
import 'package:blood_donation/Blood_Request.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Set();
  Sets();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "blood_donation",
    home: SplashScreen(),
    routes: {

      'profile': (context) => ProfilePage(),
      'logout': (context) => LoginScreen(),
      'splash': (context) => SplashScreen(),
      'login': (context) => LoginScreen(),
      'dashboard': (context) => DashboardPage(),
      'donate': (context) => EditProfile(),
      'blood_request': (context) => RequestBlood(),
      'Register': (context) => Registration(),
      'Admin': (context) => AdminPanel(),
      'UserRequest': (context) => UBloodRequests(),
      'UserDonors': (context) => UDonors(),


    },
  ));
}
