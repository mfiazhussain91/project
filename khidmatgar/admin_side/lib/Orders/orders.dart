import 'package:admin_side/Models/order_model.dart';
import 'package:admin_side/Models/user_model.dart';
import 'package:admin_side/Orders/order_detail.dart';
import 'package:admin_side/Orders/order_provider.dart';
import 'package:admin_side/Users/colors.dart';
import 'package:admin_side/Users/user_provider.dart';
import 'package:admin_side/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  late orderData _orderData;
  @override
  Widget build(BuildContext context) {
    _orderData = Provider.of(context);
    var data = _orderData.getAllCustomers;
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: Text(
            "ORDERS",
            style: GoogleFonts.pollerOne(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                )),
            textScaleFactor: 1,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: Icon(Icons.arrow_back_ios_outlined),

          )
      ),
      backgroundColor: AppColors.cupCakeColor,
      body: _orderData.getCustomerProfile.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: data.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          OrderModel _data = data[index];
          return Column(
            children: [
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersDetail(datainstance :data[index])));
                },

                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 125,
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 130,
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
                                    "Name",
                                    style: TextStyle(
                                        color: AppColors.apricotColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Icon(CupertinoIcons.arrow_right_circle,
                                    color: Colors.indigo,),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              // padding:
                              // EdgeInsets.only(left: 14.0, top: 20.0),
                              child: Text(
                                _data.Name,
                                style: GoogleFonts.pollerOne(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    )),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 130,
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
                                    "Number",
                                    style: TextStyle(
                                        color: AppColors.apricotColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Icon(CupertinoIcons.arrow_right_circle,
                                    color: Colors.indigo,),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              // padding:
                              // EdgeInsets.only(left: 14.0, top: 20.0),
                              child: Text(
                                 _data.userNumber,
                                style: GoogleFonts.pollerOne(
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
