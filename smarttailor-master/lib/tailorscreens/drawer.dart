import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarttailor/Provider/user_provider.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/drawerpages/addproduct.dart';
import 'package:smarttailor/drawerpages/customerorderlists.dart';
import 'package:smarttailor/drawerpages/profilepage.dart';
import 'package:smarttailor/screens/welcomescreen.dart';
import 'package:smarttailor/tailorscreens/ChatBox/chatBox.dart';
import 'package:smarttailor/tailorscreens/customer_orders.dart';
import '../demo.dart';
import 'female_suiting.dart';
import '3___malesuiting.dart';

class MyDrawer extends StatefulWidget {
  late userData userProvider;
  MyDrawer({required this.userProvider});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.grey.shade400,
                AppColors.whiteSmokeColor,
              ]
          ),
        ),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.grey.shade400,
                        AppColors.whiteSmokeColor,
                      ]
                  )
              ),
              accountName: Text(
                  widget.userProvider.currentUserData.firstName+" "+widget.userProvider.currentUserData.lastName,
                style: GoogleFonts.titanOne(
                  textStyle: TextStyle(
                      color: AppColors.coralColor, fontSize: 18),
                ),
              ),
              accountEmail: Text(
              widget.userProvider.currentUserData.userEmail,
                style: TextStyle(color: Colors.black87),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(widget.userProvider.currentUserData.userImage),
              ),
            ),
            ListTile(
              selectedTileColor: AppColors.apricotColor,
              title: Text(
                "Home",
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
              leading: Icon(CupertinoIcons.home, color: Colors.black87,),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => TailorProfilePage()
                ));
              },
              child: ListTile(
                selectedTileColor: AppColors.coralColor,
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(CupertinoIcons.profile_circled, color: Colors.black87,),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddProduct()));
              },
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Add Product",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(CupertinoIcons.add_circled, color: Colors.black87,),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerOrders()));
              },
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Customer Orders",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(CupertinoIcons.add_circled, color: Colors.black87,),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TailorMaleSuiting()
                    ));
              },
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Male",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(Icons.male_rounded, color: Colors.black87,),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TailorFeMaleSuiting()
                    ));
              },
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Female",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(Icons.female_rounded, color: Colors.black87,),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Room()
                    ));
              },
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Chat",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(CupertinoIcons.settings_solid, color: Colors.black87,),
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Settings",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(CupertinoIcons.settings_solid, color: Colors.black87,),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomerOrderLists()));
              },
              child: ListTile(
                selectedTileColor: AppColors.apricotColor,
                selected: true,
                title: Text(
                  "Orders List",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                leading: Icon(CupertinoIcons.list_bullet_below_rectangle, color: Colors.black87,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(thickness: 2, color: Colors.white),
            ),
            ListTile(
              onTap: ()async{
                await FirebaseAuth.instance.signOut().then((value) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WelcomeScreen()));
                });

              },
              selectedTileColor: AppColors.apricotColor,
              selected: true,
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.black87, fontSize: 15),
              ),
              leading: Icon(Icons.logout_outlined, color: Colors.black87,),
            ),
          ],
        ),
      ),
    );
  }
}

