import 'package:admin_side/Orders/order_detail.dart';
import 'package:admin_side/Orders/order_provider.dart';
import 'package:admin_side/Orders/order_provider_detail.dart';
import 'package:admin_side/Users/users.dart';
import 'package:admin_side/Users/user_provider.dart';
import 'package:admin_side/screens/admin_login.dart';
import 'package:admin_side/screens/authentication_service.dart';
import 'package:admin_side/screens/home_screen.dart';
import 'package:admin_side/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<userData>(
          create: (context) => userData(),
        ),
        ChangeNotifierProvider<orderData>(
          create: (context) => orderData(),
        ),
        ChangeNotifierProvider<orderDetailData>(
          create: (context) => orderDetailData(),
        ),
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Admin Side",
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: SplashScreen(),
        routes: {
          '/first': (context) => LoginPage(),
          '/second': (context) => HomePage(),
        },
      ),
    );
  }
}
