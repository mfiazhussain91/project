import 'package:admin_side/Orders/orders.dart';
import 'package:admin_side/Users/users.dart';
import 'package:admin_side/screens/admin_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AdminDrwer extends StatefulWidget {
  const AdminDrwer({Key? key}) : super(key: key);

  @override
  _AdminDrwerState createState() => _AdminDrwerState();
}

class _AdminDrwerState extends State<AdminDrwer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/logo.png"),
                backgroundColor: Colors.white,
              ),
              accountName: Text("Khidmatgar",
                style: GoogleFonts.pollerOne(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    )),

              ),
              accountEmail: Text("khidmatgar@gmail.com",
                style: GoogleFonts.pollerOne(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    )),
              ),

            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle_outlined, color: Colors.indigo,),
              title: Text("Users",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Users()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shop_two_outlined, color: Colors.indigo,),
              title: Text("Orders",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),

              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Orders()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout_outlined, color: Colors.indigo,),
              title: Text("Logout",  style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),),
              onTap: () async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
