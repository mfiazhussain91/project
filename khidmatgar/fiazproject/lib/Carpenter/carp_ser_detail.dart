import 'package:fiazproject/Carpenter/BurewalaShop/burewala_shop.dart';
import 'package:fiazproject/Carpenter/VehariCarpenters/vehri_shop.dart';
import 'package:fiazproject/Home/home.dart';
import 'package:fiazproject/Home/recentactivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../form.dart';

class CarpenterServicesDetail extends StatefulWidget {
  // const CarpenterServicesDetail({Key? key}) : super(key: key);
  final carp_ser_detail_name;
  final carp_ser_detail_pic;
  final carp_ser_detail_price;
  final carp_service_detail;
  CarpenterServicesDetail({
    this.carp_ser_detail_name,
    this.carp_ser_detail_pic,
    this.carp_ser_detail_price,
    this.carp_service_detail,
  });

  @override
  _CarpenterServicesDetailState createState() =>
      _CarpenterServicesDetailState();
}

class _CarpenterServicesDetailState extends State<CarpenterServicesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Carpentery Service",
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
                  widget.carp_ser_detail_pic,
                  fit: BoxFit.cover,
                ),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  title: Text(
                    widget.carp_ser_detail_name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  // trailing: Padding(
                  //   padding: const EdgeInsets.only(right: 20.0),
                  //   child: InkWell(
                  //     onTap: () {
                  //       // Navigator.push(context, MaterialPageRoute(builder:(context)=>PriceList()));
                  //       // Navigator.push(context, MaterialPageRoute(builder: context)=>PriceList());
                  //     },
                  //     child: Text(
                  //       widget.carp_ser_detail_price,
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
              widget.carp_service_detail,
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
                child: Text(widget.carp_ser_detail_name),
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
                            builder: (context) => VehariCarpenters()));
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
                            builder: (context) => BurewalaShop()));
                  },
                ),
              ],
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     // Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersDetail()));
          //     //   _men.getTailorPriceData(_data.uid).then((value) {
          //     //      _female.getTailorPriceData(_data.uid).then((value) {
          //     //        Navigator.push(
          //     //            context,
          //     //            MaterialPageRoute(
          //     //                builder: (context) => TailorProfilePage(
          //     //                      data: _data,
          //     //                    )));
          //     //     });
          //     //    }
          //     //
          //     //    );
          //   },
          //
          //   child: Container(
          //     margin: EdgeInsets.symmetric(horizontal: 15),
          //     height: 155,
          //     width: MediaQuery.of(context).size.width,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(colors: [
          //         Colors.white,
          //         Colors.indigo.shade400,
          //
          //       ]),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey,
          //           offset: Offset(0.1, 0.1),
          //           blurRadius: 10,
          //         )
          //       ],
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(15.0),
          //       child: Column(
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 width: 130,
          //                 height: 40,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.only(
          //                         bottomRight: Radius.circular(20),
          //                         topLeft: Radius.circular(20)),
          //                     gradient: LinearGradient(colors: [
          //                       Colors.indigo,
          //                       Colors.white.withOpacity(0.8),
          //                     ]),
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Colors.black38,
          //                         offset: Offset(0.1, 0),
          //                         blurRadius: 10,
          //                       )
          //                     ]
          //                 ),
          //                 child: ListTile(
          //                   title: Padding(
          //                     padding: const EdgeInsets.only(bottom: 15.0),
          //                     child: Text(
          //                       "Vehari",
          //                       style: TextStyle(
          //                           color: Colors.black,
          //                           fontSize: 15,
          //                           fontWeight: FontWeight.w800),
          //                     ),
          //                   ),
          //                   trailing: Padding(
          //                     padding: const EdgeInsets.only(bottom: 15.0),
          //                     child: Icon(CupertinoIcons.arrow_right_circle,
          //                       color: Colors.indigo,),
          //                   ),
          //                 ),
          //               ),
          //               Container(
          //                 alignment: Alignment.topLeft,
          //                 // padding:
          //                 // EdgeInsets.only(left: 14.0, top: 20.0),
          //                 child: Text(
          //                   "Ali",
          //                   style: GoogleFonts.pollerOne(
          //                       textStyle: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 16,
          //                         color: Colors.white,
          //                       )),
          //                 ),
          //               ),
          //
          //             ],
          //           ),
          //           SizedBox(height: 15.0,),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 width: 130,
          //                 height: 40,
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.only(
          //                         bottomRight: Radius.circular(20),
          //                         topLeft: Radius.circular(20)),
          //                     gradient: LinearGradient(colors: [
          //                       Colors.indigo,
          //                       Colors.white.withOpacity(0.8),
          //                     ]),
          //                     boxShadow: [
          //                       BoxShadow(
          //                         color: Colors.black38,
          //                         offset: Offset(0.1, 0),
          //                         blurRadius: 10,
          //                       )
          //                     ]),
          //                 child: ListTile(
          //                   title: Padding(
          //                     padding: const EdgeInsets.only(bottom: 15.0),
          //                     child: Text(
          //                       "Burewala",
          //                       style: TextStyle(
          //                           color: Colors.black,
          //                           fontSize: 15,
          //                           fontWeight: FontWeight.w800),
          //                     ),
          //                   ),
          //                   trailing: Padding(
          //                     padding: const EdgeInsets.only(bottom: 15.0),
          //                     child: Icon(CupertinoIcons.arrow_right_circle,
          //                       color: Colors.indigo,),
          //                   ),
          //                 ),
          //               ),
          //               Container(
          //                 alignment: Alignment.topLeft,
          //                 // padding:
          //                 // EdgeInsets.only(left: 14.0, top: 20.0),
          //                 child: Text(
          //                   "031284657483",
          //                   style: GoogleFonts.pollerOne(
          //                       textStyle: TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 15,
          //                         color: Colors.white,
          //                       )),
          //                 ),
          //               ),
          //
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
