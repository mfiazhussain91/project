import 'package:fiazproject/Home/home.dart';
import 'package:fiazproject/form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurewalaPlumShopDetail extends StatefulWidget {
  const BurewalaPlumShopDetail({Key? key}) : super(key: key);

  @override
  _BurewalaPlumShopDetailState createState() => _BurewalaPlumShopDetailState();
}

class _BurewalaPlumShopDetailState extends State<BurewalaPlumShopDetail> {
  String imageUrl1 = "images/providerimg.jpg";
  String imageUrl2 =
      "images/watermotor.jpg";
  String imageUrl3 =
      "images/tank.jpg";
  @override
  Widget build(BuildContext context) {
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
                "Shop Detail",
                style: GoogleFonts.pollerOne(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    )),
                textScaleFactor: 1,
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
      // backgroundColor: AppColors.cupCakeColor,
      body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Image.asset(
                    imageUrl1,
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: -45,
                    right:50,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/plum.jpg"
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: -75,
                  //   left: 150,
                  //   child: Text(
                  //     // widget.data.firstName +
                  //     //     " " +
                  //     //     widget.data.lastName,
                  //     "Stylish furniture Mart",
                  //     style: GoogleFonts.pollerOne(
                  //         textStyle: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 16,
                  //           color: Colors.black,
                  //         )),
                  //   ),
                  // )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Shop Detail",
                  style: GoogleFonts.pollerOne(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ),
              ),
              ListTile(
                title: Text(
                  // widget.data.phone,
                  "Name",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(""
                      "Ali Ahmad",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,

                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              ListTile(

                title: Text(
                  // widget.data.phone,
                  "Phone Number",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("03125855447",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,

                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),

              ListTile(

                title: Text(
                  // widget.data.phone,
                  "Email",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("aliahmad@gmail.com",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold
                    ),
                  )
              ),
              // Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 18),
              //     child: Divider(
              //       thickness: 1,
              //       color: Colors.blueGrey,
              //     )),
              // ListTile(
              //
              //   title: Text(
              //     // widget.data.phone,
              //     "Service",
              //     style: GoogleFonts.lato(
              //       textStyle: TextStyle(
              //           color: Colors.black,
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ),
              //
              // ),
              // Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     child: Text("Installation",
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 16,
              //         // fontWeight: FontWeight.bold
              //       ),
              //     )
              // ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              ListTile(

                title: Text(
                  // widget.data.phone,
                  "Shop Name",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Burewala Plumbers",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold
                    ),
                  )
              ),
              // Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 18),
              //     child: Divider(
              //       thickness: 1,
              //       color: Colors.blueGrey,
              //     )),
              // ListTile(
              //
              //   title: Text(
              //     // widget.data.phone,
              //     "Problem",
              //     style: GoogleFonts.lato(
              //       textStyle: TextStyle(
              //           color: Colors.black,
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ),
              //
              // ),
              // Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     child: Text("Door Fixer",
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 16,
              //         // fontWeight: FontWeight.bold
              //       ),
              //     )
              // ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              ListTile(

                title: Text(
                  // widget.data.phone,
                  "Address",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("College Road,Burewala,Punjab,Pakistan ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Plumbing Charges",
                  style: GoogleFonts.pollerOne(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      )),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Kitchen Repairing",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 75.0),
                    child: Text(
                      "1000 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Bathroom Repairing",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 60.0),
                    child: Text(
                      "1500 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Water Motor",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 115.0),
                    child: Text(
                      "1000 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Others",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Expanded(
                  child:GestureDetector(
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
                        child: Text("Hire Now",
                            style: GoogleFonts.pollerOne(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20))),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              imageUrl3,
                            ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(

                        image: DecorationImage(
                            image: AssetImage(
                              imageUrl2,
                            ))),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Description",
                  style: GoogleFonts.pollerOne(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Want your equipment at top condition? Well, wander no more. Avail services of our technicians right now ",
                ),
              ),
              SizedBox(height: 30.0),
            ],
          )),
    );
  }
}
