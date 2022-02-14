import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';
class callSerivices {
   call(String number) => launch('tel:$number');
}

GetIt locator = GetIt();
void Set() {
  locator.registerSingleton(callSerivices());
}



class AvDonors extends StatefulWidget {
  @override
  _AvDonorsState createState() => _AvDonorsState();
}

class _AvDonorsState extends State<AvDonors> {
  final ref = FirebaseFirestore.instance.collection('Donate');
  final callSerivices _serivices = locator<callSerivices>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Doners'),
        backgroundColor: Colors.indigo,
      ),

      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                itemBuilder: (_, index) {
                  DocumentSnapshot ds=snapshot.data.docs[index];
                  return  Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      // color: Colors.grey[200],
                      child: Column(
                          children:[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width:50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Icon(
                                        Icons.add_location_alt_rounded,
                                        color: Colors.white,
                                      ),
                                    ),

                                  ),
                                  Container(
                                    height: 50,
                                    width:155,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 4.0, left: 5.0),
                                      child: Center(
                                        child: Text(
                                          'N a m e  ',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 25.0),
                                        ),
                                      ),
                                    ),

                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 4.0, left: 5.0),
                                      child: Center(
                                        child: Text(
                                          snapshot.data.docs[index]['NameController'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                            Container(

                              height: 5.0,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.black54,width: 3.0),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width:50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Icon(
                                        Icons.group_add_rounded,
                                        color: Colors.white,
                                      ),
                                    ),


                                  ),
                                  Container(
                                    height: 50,
                                    width:155,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 4.0, left: 5.0),
                                      child: Center(
                                        child: Text(
                                          'Blood Group',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                    ),

                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 4.0, left: 5.0),
                                      child: Center(
                                        child: Text(
                                          snapshot.data.docs[index]['bloodGroupController'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),



                            Container(
                              height: 50,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width:50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child:  Icon(
                                        Icons.add_location_alt_rounded,
                                        color: Colors.white,
                                      ),
                                    ),

                                  ),
                                  Container(
                                    height: 50,
                                    width:155,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 4.0, left: 5.0),
                                      child: Center(
                                        child: Text(
                                          'A d d r e s s',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                    ),

                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 4.0, left: 5.0),
                                      child: Center(
                                        child: Text(
                                          snapshot.data.docs[index]['addressController'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),

                            Container(
                              height: 50,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width:50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child:  Icon(
                                        Icons.group_add_rounded,
                                        color: Colors.white,
                                      ),
                                    ),

                                  ),
                                  Container(
                                    height: 50,
                                    width:155,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 4.0, left: 5.0),
                                      child: Center(
                                        child: Text(
                                          'G e n d e r',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                    ),

                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 4.0, left: 5.0),
                                      child: Center(
                                        child: Text(
                                          snapshot.data.docs[index]['genderController'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),


                            Container(

                              height: 55,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width:50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.white,
                                      ),
                                    ),

                                  ),
                                  Container(
                                    height: 47,
                                    width:155,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 4.0, left: 5.0),
                                      child: Center(
                                        child: Text(
                                          'D a t e',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 22.0),
                                        ),
                                      ),
                                    ),

                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.only(top: 4.0, left: 5.0),
                                      child: Center(
                                        child: Text(
                                          snapshot.data.docs[index]['dateController'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                            Container(
                              height: 50,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width:50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Icon(
                                        Icons.add_ic_call,
                                        color: Colors.white,
                                      ),
                                    ),

                                  ),
                                  GestureDetector(
                                    onTap: ()=>_serivices.call(ds['phoneNumberController']),
                                    child: Container(
                                      width:275,

                                      child: Center(
                                        child: Text(
                                          snapshot.data.docs[index]['phoneNumberController'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),

                            ),

                          ]
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.blue,
                              Colors.blueGrey,

                            ],
                          )
                      ),
                    );


                });
          }),
    );
  }
}
