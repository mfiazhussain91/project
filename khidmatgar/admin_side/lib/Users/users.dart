import 'package:admin_side/Models/user_model.dart';
import 'package:admin_side/Users/user_provider.dart';
import 'package:admin_side/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../screens/MyDrawer.dart';
import 'colors.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  // String imageUrl = "https://avatars.githubusercontent.com/u/73787635?v=4";
  // String imageUrl1 = "https://avatars.githubusercontent.com/u/73393935?v=4";
  // String imageUrl2 = "https://avatars.githubusercontent.com/u/73339220?v=4";
  // String imageUrl3 =
  //     "https://scontent.flhe25-1.fna.fbcdn.net/v/t1.6435-9/240417501_1280664795688977_6569811042919174013_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeFQx8Vv30BpFmAcdn2DB0OBZLzo6Tf79YNkvOjpN_v1g9GHrmp8f_2EfbLNtig-L0p8wAurl0KjJRDOjorp7SSX&_nc_ohc=CptwvX1HbEcAX-jUNLg&_nc_ht=scontent.flhe25-1.fna&oh=a2fadfb25efc89c72306d097a0a236a6&oe=618D2D85";

  late userData _userData;

  @override
  Widget build(BuildContext context) {
    _userData = Provider.of(context);
    var data = _userData.getAllTailors;
    return Scaffold(
      appBar: AppBar(

        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "USERS",
              style: GoogleFonts.pollerOne(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  )),

            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
          
        )
      ),
      backgroundColor: AppColors.cupCakeColor,
      body: _userData.getTailorsProfile.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                UserModel _data = data[index];
                return Column(
                  children: [
                    SizedBox(height: 20),
                    GestureDetector(

                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.indigo.shade400,
                          ]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.1, 0.1),
                              blurRadius: 10,
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundImage:
                                      NetworkImage(_data.userImage),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    padding:
                                        EdgeInsets.only(left: 14.0, top: 20.0),
                                    child: Text(
                                      _data.Name + " \n"+ _data.userEmail +" ",

                                      style: GoogleFonts.knewave(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}


