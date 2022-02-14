import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiazproject/Home/drawer.dart';
import 'package:fiazproject/splash_screen.dart';
import 'package:fiazproject/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Config/config.dart';
import 'Home/home.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Khidmatgar.auth = FirebaseAuth.instance;
  Khidmatgar.sharedPreferences = await SharedPreferences.getInstance();
  Khidmatgar.firebaseFirestore = FirebaseFirestore.instance;
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<userData>(
          create: (context) => userData(),
        ),
      ],

    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "KHIDMATGAR",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home:SplashScreen (),
      routes: {
        '/first': (context) => WelcomePage(),
        '/second': (context) => HomePage(),
        '/third': (context) => LoginPage(),
      },
    ),
    );
  }
}
