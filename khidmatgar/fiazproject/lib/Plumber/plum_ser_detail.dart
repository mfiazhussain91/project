import 'package:fiazproject/Home/home.dart';
import 'package:fiazproject/Home/recentactivity.dart';
import 'package:fiazproject/Plumber/BurewalaShop/burewala_plum_shop.dart';
import 'package:fiazproject/Plumber/VehariShop/vehari_plum_shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../form.dart';

class PlumberServicesDetail extends StatefulWidget {
  // const PlumberServicesDetail({Key? key}) : super(key: key);
  final plum_ser_detail_name;
  final plum_ser_detail_pic;
  final plum_ser_detail_price;
  final plum_service_detail;
  PlumberServicesDetail({
    this.plum_ser_detail_name,
    this.plum_ser_detail_pic,
    this.plum_ser_detail_price,
    this.plum_service_detail,
  });

  @override
  _PlumberServicesDetailState createState() => _PlumberServicesDetailState();
}

class _PlumberServicesDetailState extends State<PlumberServicesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Plumbing Service",
          style: GoogleFonts.pollerOne(textStyle: TextStyle()),
          textScaleFactor: 1.0,
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade500,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  widget.plum_ser_detail_pic,
                  fit: BoxFit.cover,
                ),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  title: Text(
                    widget.plum_ser_detail_name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  // trailing: Padding(
                  //   padding: const EdgeInsets.only(right: 20.0),
                  //   child: InkWell(
                  //     onTap: (){
                  //       Navigator.push(context, MaterialPageRoute(builder:(context)=>PriceList()));
                  //       // Navigator.push(context, MaterialPageRoute(builder: context)=>PriceList());
                  //     },
                  //     child: Text(
                  //       widget.plum_ser_detail_price,
                  //       style: TextStyle(
                  //         decoration: TextDecoration.underline,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 16.0,
                  //         color: Colors.indigo,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: Expanded(
          //     child:GestureDetector(
          //       child: Container(
          //         margin: EdgeInsets.symmetric(horizontal: 25),
          //         width: double.infinity,
          //         height: 40,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(20),
          //             color: Colors.indigo,
          //             boxShadow: [
          //               BoxShadow(
          //                   color: Colors.indigo,
          //                   spreadRadius: 1,
          //                   offset: Offset(1, 0),
          //                   blurRadius: 8)
          //             ]),
          //         child: Center(
          //           child: Text("Book Now",
          //               style: GoogleFonts.knewave(
          //                   textStyle: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 20))),
          //         ),
          //       ),
          //       onTap: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => MyApp()));
          //       },
          //     ),
          //   ),
          // ),
          Divider(),
          ListTile(
            title: Text(
              "Service Detail",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              widget.plum_service_detail,
              textAlign: TextAlign.justify,
            ),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  12.0,
                  5.0,
                  5.0,
                  5.0,
                ),
                child: Text(
                  "Service Name:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.plum_ser_detail_name),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  12.0,
                  5.0,
                  5.0,
                  5.0,
                ),
                child: Text(
                  "Provide By:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Khidmatgar"),
              ),
            ],
          ),
          Divider(),
          Center(
            child: Text(
              "Providers",
              style: GoogleFonts.pollerOne(textStyle: TextStyle()),
              textScaleFactor: 1.4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        gradient: LinearGradient(colors: [
                          Colors.indigo,
                          Colors.white.withOpacity(0.8),
                        ]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0.1, 0),
                            blurRadius: 10,
                          )
                        ]),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          "Vehari",
                          style: GoogleFonts.pollerOne(
                              textStyle: TextStyle(color: Colors.white)),
                          textScaleFactor: 1.0,
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Icon(
                          CupertinoIcons.arrow_right_circle,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VehariPlumShop()));
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                GestureDetector(
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        gradient: LinearGradient(colors: [
                          Colors.indigo,
                          Colors.white.withOpacity(0.8),
                        ]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0.1, 0),
                            blurRadius: 10,
                          )
                        ]),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text(
                          "Burewala",
                          style: GoogleFonts.pollerOne(
                              textStyle: TextStyle(color: Colors.white)),
                          textScaleFactor: 1.0,
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Icon(
                          CupertinoIcons.arrow_right_circle,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BurewalaPlumShop()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
