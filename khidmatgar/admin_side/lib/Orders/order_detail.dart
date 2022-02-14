import 'package:admin_side/Models/order_model.dart';
import 'package:admin_side/Models/order_model_detail.dart';
import 'package:admin_side/Orders/order_provider_detail.dart';
import 'package:admin_side/Users/colors.dart';
import 'package:admin_side/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrdersDetail extends StatefulWidget {
  const OrdersDetail({Key? key, required this.datainstance}) : super(key: key);
  final OrderModel datainstance;

  @override
  _OrdersDetailState createState() => _OrdersDetailState();
}

class _OrdersDetailState extends State<OrdersDetail> {
  _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  late orderDetailData _orderDatadetail;
  String imageUrl1 = "images/providerimg.jpg";
  String imageUrl2 = "images/caretaker.jpg";
  String imageUrl3 = "images/wallpaint.jpg";
  @override
  Widget build(BuildContext context) {
    _orderDatadetail = Provider.of(context);

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
                "ORDERS",
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: Icon(Icons.arrow_back_ios_outlined),
          )),
      backgroundColor: AppColors.cupCakeColor,
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
            ],
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              "Service Detail",
              style: GoogleFonts.pollerOne(
                  textStyle: TextStyle(
                color: AppColors.eigengrauColor,
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
                    color: AppColors.eigengrauColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.datainstance.Name,
                // "Ali Ahmad",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 16,
                ),
              )),
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
                    color: AppColors.eigengrauColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            trailing: IconButton(
              icon: new Icon(
                Icons.phone,
                color: Colors.green,
              ),
              onPressed: () {
                _callNumber(
                  widget.datainstance.userNumber,
                );
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.datainstance.userNumber,
                // "03125855447",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 16,
                ),
              )),
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
                    color: AppColors.eigengrauColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.datainstance.userEmail,
                // "aliahmadbrw789@gmail.com",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold
                ),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          ListTile(
            title: Text(
              // widget.data.phone,
              "Service",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: AppColors.eigengrauColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.datainstance.service,
                // "Installation",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold
                ),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          ListTile(
            title: Text(
              // widget.data.phone,
              "Service Name",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: AppColors.eigengrauColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.datainstance.serviceName,
                //  "Carpentry",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold
                ),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          ListTile(
            title: Text(
              // widget.data.phone,
              "Problem",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: AppColors.eigengrauColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.datainstance.userProblem,
                // "Door Fixer",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold
                ),
              )),
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
                    color: AppColors.eigengrauColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.datainstance.userAddress,
                // "Street No. 02,Pir Murad,Vehari,Punjab,Pakistan ",
                style: TextStyle(
                  color: AppColors.eigengrauColor,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold
                ),
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey,
              )),
          SizedBox(height: 20),
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
                color: AppColors.eigengrauColor,
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

      // body: _orderDatadetail.getCustomerProfile.isEmpty
      //     ? Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //   itemCount: data.length,
      //   physics: BouncingScrollPhysics(),
      //   itemBuilder: (context, index) {
      //     OrderModelDetail _data = data[index];
      //     return Column(
      //       children: [
      //         SizedBox(height: 20),
      //         GestureDetector(
      //           onTap: () {
      //             //   _men.getTailorPriceData(_data.uid).then((value) {
      //             //      _female.getTailorPriceData(_data.uid).then((value) {
      //             //        Navigator.push(
      //             //            context,
      //             //            MaterialPageRoute(
      //             //                builder: (context) => TailorProfilePage(
      //             //                      data: _data,
      //             //                    )));
      //             //     });
      //             //    }
      //             //
      //             //    );
      //           },
      //
      //           child: Container(
      //             margin: EdgeInsets.symmetric(horizontal: 15),
      //             height: 400,
      //             width: MediaQuery.of(context).size.width,
      //             decoration: BoxDecoration(
      //               gradient: LinearGradient(colors: [
      //                 Colors.white,
      //                 Colors.indigo.shade400,
      //
      //               ]),
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.grey,
      //                   offset: Offset(0.1, 0.1),
      //                   blurRadius: 10,
      //                 )
      //               ],
      //               borderRadius: BorderRadius.circular(15),
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.all(15.0),
      //               child: Column(
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(
      //                         width: 130,
      //                         height: 40,
      //                         decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.only(
      //                                 bottomRight: Radius.circular(20),
      //                                 topLeft: Radius.circular(20)),
      //                             gradient: LinearGradient(colors: [
      //                               Colors.indigo,
      //                               Colors.white.withOpacity(0.8),
      //                             ]),
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 color: Colors.black38,
      //                                 offset: Offset(0.1, 0),
      //                                 blurRadius: 10,
      //                               )
      //                             ]),
      //                         child: ListTile(
      //                           title: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Text(
      //                               "Name",
      //                               style: TextStyle(
      //                                   color: AppColors.apricotColor,
      //                                   fontSize: 15,
      //                                   fontWeight: FontWeight.w800),
      //                             ),
      //                           ),
      //                           trailing: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Icon(CupertinoIcons.arrow_right_circle,
      //                               color: Colors.indigo,),
      //                           ),
      //                         ),
      //                       ),
      //                       Container(
      //                         alignment: Alignment.topLeft,
      //                         // padding:
      //                         // EdgeInsets.only(left: 14.0, top: 20.0),
      //                         child: Text(
      //                           _data.Name,
      //                           style: GoogleFonts.pollerOne(
      //                               textStyle: TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 16,
      //                                 color: Colors.white,
      //                               )),
      //                         ),
      //                       ),
      //
      //                     ],
      //                   ),
      //                   SizedBox(height: 15.0,),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(
      //                         width: 130,
      //                         height: 40,
      //                         decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.only(
      //                                 bottomRight: Radius.circular(20),
      //                                 topLeft: Radius.circular(20)),
      //                             gradient: LinearGradient(colors: [
      //                               Colors.indigo,
      //                               Colors.white.withOpacity(0.8),
      //                             ]),
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 color: Colors.black38,
      //                                 offset: Offset(0.1, 0),
      //                                 blurRadius: 10,
      //                               )
      //                             ]),
      //                         child: ListTile(
      //                           title: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Text(
      //                               "Number",
      //                               style: TextStyle(
      //                                   color: AppColors.apricotColor,
      //                                   fontSize: 15,
      //                                   fontWeight: FontWeight.w800),
      //                             ),
      //                           ),
      //                           trailing: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Icon(CupertinoIcons.arrow_right_circle,
      //                               color: Colors.indigo,),
      //                           ),
      //                         ),
      //                       ),
      //                       Container(
      //                         alignment: Alignment.topLeft,
      //                         // padding:
      //                         // EdgeInsets.only(left: 14.0, top: 20.0),
      //                         child: Text(
      //                   _data.userNumber,
      //                           style: GoogleFonts.pollerOne(
      //                               textStyle: TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15,
      //                                 color: Colors.white,
      //                               )),
      //                         ),
      //                       ),
      //
      //                     ],
      //                   ),
      //                   SizedBox(height: 15.0,),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(
      //                         width: 130,
      //                         height: 40,
      //                         decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.only(
      //                                 bottomRight: Radius.circular(20),
      //                                 topLeft: Radius.circular(20)),
      //                             gradient: LinearGradient(colors: [
      //                               Colors.indigo,
      //                               Colors.white.withOpacity(0.8),
      //                             ]),
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 color: Colors.black38,
      //                                 offset: Offset(0.1, 0),
      //                                 blurRadius: 10,
      //                               )
      //                             ]),
      //                         child: ListTile(
      //                           title: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Text(
      //                               "Service",
      //                               style: TextStyle(
      //                                   color: AppColors.apricotColor,
      //                                   fontSize: 15,
      //                                   fontWeight: FontWeight.w800),
      //                             ),
      //                           ),
      //                           trailing: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Icon(CupertinoIcons.arrow_right_circle,
      //                               color: Colors.indigo,),
      //                           ),
      //                         ),
      //                       ),
      //                       Container(
      //                         alignment: Alignment.topLeft,
      //                         // padding:
      //                         // EdgeInsets.only(left: 14.0, top: 20.0),
      //                         child: Text(
      //                           _data.service,
      //                           style: GoogleFonts.pollerOne(
      //                               textStyle: TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15,
      //                                 color: Colors.white,
      //                               )),
      //                         ),
      //                       ),
      //
      //                     ],
      //                   ),
      //                   SizedBox(height: 15.0,),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(
      //                         width: 130,
      //                         height: 40,
      //                         decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.only(
      //                                 bottomRight: Radius.circular(20),
      //                                 topLeft: Radius.circular(20)),
      //                             gradient: LinearGradient(colors: [
      //                               Colors.indigo,
      //                               Colors.white.withOpacity(0.8),
      //                             ]),
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 color: Colors.black38,
      //                                 offset: Offset(0.1, 0),
      //                                 blurRadius: 10,
      //                               )
      //                             ]),
      //                         child: ListTile(
      //                           title: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Text(
      //                               "Service Name",
      //                               style: TextStyle(
      //                                   color: AppColors.apricotColor,
      //                                   fontSize: 15,
      //                                   fontWeight: FontWeight.w800),
      //                             ),
      //                           ),
      //                           trailing: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Icon(CupertinoIcons.arrow_right_circle,
      //                               color: Colors.indigo,),
      //                           ),
      //                         ),
      //                       ),
      //                       Container(
      //                         alignment: Alignment.topLeft,
      //                         // padding:
      //                         // EdgeInsets.only(left: 14.0, top: 20.0),
      //                         child: Text(
      //                           _data.serviceName,
      //                           style: GoogleFonts.pollerOne(
      //                               textStyle: TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15,
      //                                 color: Colors.white,
      //                               )),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   SizedBox(height: 15.0,),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(
      //                         width: 130,
      //                         height: 40,
      //                         decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.only(
      //                                 bottomRight: Radius.circular(20),
      //                                 topLeft: Radius.circular(20)),
      //                             gradient: LinearGradient(colors: [
      //                               Colors.indigo,
      //                               Colors.white.withOpacity(0.8),
      //                             ]),
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 color: Colors.black38,
      //                                 offset: Offset(0.1, 0),
      //                                 blurRadius: 10,
      //                               )
      //                             ]),
      //                         child: ListTile(
      //                           title: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Text(
      //                               "Problem",
      //                               style: TextStyle(
      //                                   color: AppColors.apricotColor,
      //                                   fontSize: 15,
      //                                   fontWeight: FontWeight.w800),
      //                             ),
      //                           ),
      //                           trailing: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Icon(CupertinoIcons.arrow_right_circle,
      //                               color: Colors.indigo,),
      //                           ),
      //                         ),
      //                       ),
      //                       Container(
      //                         alignment: Alignment.topLeft,
      //                         // padding:
      //                         // EdgeInsets.only(left: 14.0, top: 20.0),
      //                         child: Text(
      //                           _data.userProblem,
      //                           style: GoogleFonts.pollerOne(
      //                               textStyle: TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15,
      //                                 color: Colors.white,
      //                               )),
      //                         ),
      //                       ),
      //
      //                     ],
      //                   ),
      //                   SizedBox(height: 15.0,),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(
      //                         width: 130,
      //                         height: 40,
      //                         decoration: BoxDecoration(
      //                             borderRadius: BorderRadius.only(
      //                                 bottomRight: Radius.circular(20),
      //                                 topLeft: Radius.circular(20)),
      //                             gradient: LinearGradient(colors: [
      //                               Colors.indigo,
      //                               Colors.white.withOpacity(0.8),
      //                             ]),
      //                             boxShadow: [
      //                               BoxShadow(
      //                                 color: Colors.black38,
      //                                 offset: Offset(0.1, 0),
      //                                 blurRadius: 10,
      //                               )
      //                             ]),
      //                         child: ListTile(
      //                           title: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Text(
      //                               "Address",
      //                               style: TextStyle(
      //                                   color: AppColors.apricotColor,
      //                                   fontSize: 15,
      //                                   fontWeight: FontWeight.w800),
      //                             ),
      //                           ),
      //                           trailing: Padding(
      //                             padding: const EdgeInsets.only(bottom: 15.0),
      //                             child: Icon(CupertinoIcons.arrow_right_circle,
      //                               color: Colors.indigo,),
      //                           ),
      //                         ),
      //                       ),
      //                       Container(
      //                         alignment: Alignment.topLeft,
      //                         // padding:
      //                         // EdgeInsets.only(left: 14.0, top: 20.0),
      //                         child: Text(
      //                           _data.userAddress,
      //                           style: GoogleFonts.pollerOne(
      //                               textStyle: TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15,
      //                                 color: Colors.white,
      //                               )),
      //                         ),
      //                       ),
      //
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
