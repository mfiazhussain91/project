import 'package:fiazproject/Ac%20Electrician/BurewalaShop/burewala_acelect_shop.dart';
import 'package:fiazproject/Ac%20Electrician/VehariShop/vehari_acelect_shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AcElectricianServicesDetail extends StatefulWidget {
  // const ElectricianServicesDetail({Key? key}) : super(key: key);
  final acelec_ser_detail_name;
  final acelec_ser_detail_pic;
  final acelect_list;
  final acelec_service_detail;
  // final elec_service_pressed;
  AcElectricianServicesDetail({
    this.acelec_ser_detail_name,
    this.acelec_ser_detail_pic,
    this.acelect_list,
    this.acelec_service_detail,
  });

  @override
  _AcElectricianServicesDetailState createState() =>
      _AcElectricianServicesDetailState();
}

class _AcElectricianServicesDetailState
    extends State<AcElectricianServicesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AC Electric Service",
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
                  widget.acelec_ser_detail_pic,
                  fit: BoxFit.cover,
                ),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  title: Text(
                    widget.acelec_ser_detail_name,
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
                  //       widget.acelect_list,
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 16.0,
                  //         color: Colors.indigo,
                  //         decoration: TextDecoration.underline,
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
          //                     MaterialPageRoute(builder: (context) => ACForm()));
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
              widget.acelec_service_detail,
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
                child: Text(widget.acelec_ser_detail_name),
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
                            builder: (context) => VehariACElectricShop()));
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
                            builder: (context) => BurewalaACElectricShop()));
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
