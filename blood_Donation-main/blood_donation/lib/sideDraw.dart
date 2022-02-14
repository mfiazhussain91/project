import 'package:blood_donation/Blood_Request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Donars.dart';
import 'loginScreen.dart';


class SideDraw extends StatefulWidget {
  @override
  _SideDrawState createState() => _SideDrawState();
}

class _SideDrawState extends State<SideDraw> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 113,
                    width: 113,

                  ),
                  SizedBox(height: 8),
                  Text(
                    'Main Menu',
                    style: TextStyle(

                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),

          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 40,
              color: Colors.indigo,
            ),
            trailing: Icon(Icons.edit),
            title: Text("Home"),
            subtitle: Text("The Home Page of this application."),
            onTap: () {
              Navigator.pushNamed(context, 'dashboard');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
              color: Colors.indigo,
            ),
            title: Text("Donars"),
            subtitle: Text("Check Available Donars"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AvDonors()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
              color: Colors.indigo,
            ),
            title: Text("Emergency Need"),
            subtitle: Text("Emergency Request"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Blood_Request_Page()));
            },
          ),

          ListTile(
            leading: Icon(
              Icons.contact_support,
              size: 40,
              color: Colors.indigo,
            ),
            onTap: (){
              showAboutDialog(context: context,
                applicationName: "Bloood Donation",
                applicationVersion: "0.0.1",
                applicationLegalese: "Developed by AR Rehman, Faisal Zulfiqar, Ali Ahmad and Fiaz Hussain",
                applicationIcon: Icon(Icons.add_location_outlined,
                  size: 80,
                  color: Colors.red,
                ),
                children: [
                  Text("App Information"),
                  Text("App Privacy Policy"),
                  Text("App Terms of Policy"),
                ],
              );
            },
            subtitle: Text("Want to know about us"),
            title: Text("About Us"),
          ),

          ListTile(
            leading: Icon(
              Icons.backspace,
              size: 40,
              color: Colors.indigo,
            ),
            title: Text("Log Out"),
            subtitle: Text("End your session."),
            onTap: () {
              _signOut().whenComplete(() =>  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen())));
            },
          ),
        ],
      ),
    );
  }
}

