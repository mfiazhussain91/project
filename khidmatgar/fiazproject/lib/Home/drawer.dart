import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiazproject/Home/about.dart';
import 'package:fiazproject/Home/contactus.dart';
import 'package:fiazproject/Home/home.dart';
import 'package:fiazproject/model/user_model.dart';
import 'package:fiazproject/model/user_model.dart';
import 'package:fiazproject/model/user_model.dart';
import 'package:fiazproject/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../login.dart';

class MyDrawer extends StatefulWidget {
  late userData userProvider;
  MyDrawer({required this.userProvider});
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class userData extends ChangeNotifier {
  late UserModel currentData;

  void getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("CustomerUserRecord")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        uid: value.get("userUid"),
        email: value.get("email"),
        userImage: value.get("userImage"),
        name: value.get("name"),
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData;
  }
}

class _MyDrawerState extends State<MyDrawer> {
  bool err = false;
  String msgErr = '';

  @override
  void initState() {
    super.initState();
  }

  void whatsAppOpen() async {
    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

    if (whatsapp) {
      await FlutterLaunch.launchWhatsapp(
          phone: "+923047447970", message: "Hi, Khidmatgar");
    } else {
      setState(() {
        err = false;
        msgErr = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPictureSize: Size.square(80),
              accountName: Text(
                widget.userProvider.currentUserData.name,
                style: GoogleFonts.titanOne(
                  textStyle: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              accountEmail: Text(
                widget.userProvider.currentUserData.email,
                style: TextStyle(color: Colors.black87),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.userProvider.currentUserData.userImage),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.indigo,
              ),
              title: Text(
                "HomePage",
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.directions_outlined,
                color: Colors.indigo,
              ),
              title: Text("View Services"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.indigo,
              ),
              title: Text(
                "Whatsapp Us",
              ),
              onTap: () {
                whatsAppOpen();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.contact_page,
                color: Colors.indigo,
              ),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Contactus()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Colors.indigo,
              ),
              title: Text("About Us"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Colors.indigo,
              ),
              title: Text("About App"),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Khidmatgar",
                  applicationVersion: "0.0.1",
                  applicationLegalese:
                      "Developed by Ali Ahmad and Fiaz Hussain",
                  applicationIcon: Icon(
                    Icons.help_outline_outlined,
                    size: 55,
                    color: Colors.indigo,
                  ),
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("App Information"),
                    Text("App Privacy Policy"),
                    Text("App Terms of Policy"),
                  ],
                );
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => AboutApp()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.indigo,
              ),
              title: Text("Logout"),
              onTap: () async {
                print("Clicked");
                GoogleSignIn().disconnect();
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
