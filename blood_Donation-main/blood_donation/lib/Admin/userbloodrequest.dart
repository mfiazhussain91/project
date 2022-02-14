import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'EditBloodRequest.dart';
class UBloodRequests extends StatelessWidget {

  final ref = FirebaseFirestore.instance.collection('bloodrequest');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Blood Request'),
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (_) => editbloodrequest(
                               docToEdit: snapshot.data.docs[index],
                             )));
                    },
                    child: Container(

                      margin: EdgeInsets.all(10),
                      height: 40,

                      child: Column(
                        children:[
                          Container(
                            // margin: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 60,
                                width:50,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Icon(
                                    Icons.group_add_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide( //                    <--- top side
                                          color: Colors.blueAccent,
                                          width: 3.0,
                                        ),
                                       )
                                ),
                              ),
                              Container(
                                height: 60,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(top: 4.0, left: 5.0),
                                  child: Center(
                                    child: Text(
                                      'Blood Group ',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 25.0),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide( //                    <--- top side
                                        color: Colors.blueAccent,
                                        width: 3.0,
                                      ),
                                    )
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
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Colors.blueAccent)
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
                            height: 50.0,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  width:50,
                                  child: Padding(

                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Icon(
                                      Icons.add_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide( //                    <--- top side
                                          color: Colors.blueAccent,
                                          width: 3.0,
                                        ),
                                      )
                                  ),
                                ),
                                Container(
                                  height: 50.0,
                                  width:155,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 4.0, left: 5.0),
                                    child: Center(
                                      child: Text(
                                        'Blood Amount',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide( //                    <--- top side
                                          color: Colors.blueAccent,
                                          width: 3.0,
                                        ),
                                      )
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 4.0, left: 5.0),
                                    child: Center(
                                      child: Text(
                                        snapshot.data.docs[index]['amountController'],
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
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Colors.blueAccent)
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
                            height: 55.0,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 55.0,
                                  width:50,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Icon(
                                      Icons.add_ic_call,
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide( //                    <--- top side
                                          color: Colors.blueAccent,
                                          width: 3.0,
                                        ),
                                      )
                                  ),
                                ),
                                Container(
                                  height: 55.0,
                                  width:155,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 4.0, left: 5.0),
                                    child: Center(
                                      child: Text(
                                        'Phone Number',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide( //                    <--- top side
                                          color: Colors.blueAccent,
                                          width: 3.0,
                                        ),
                                      )
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 4.0, left: 5.0),
                                    child: Center(
                                      child: Text(
                                        snapshot.data.docs[index]['phoneNumberController'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Colors.blueAccent)
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
                            height: 55.0,

                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 55.0,
                                  width:50,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child:  Icon(
                                      Icons.add_location_alt_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide( //                    <--- top side
                                          color: Colors.blueAccent,
                                          width: 3.0,
                                        ),
                                      )
                                  ),
                                ),
                                Container(
                                  height: 55.0,

                                  width:155,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 4.0, left: 5.0),
                                    child: Center(
                                      child: Text(
                                        'Address',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 22.0),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide( //                    <--- top side
                                          color: Colors.blueAccent,
                                          width: 3.0,
                                        ),
                                      )
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
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Colors.blueAccent)
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
                            height: 55.0,

                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 55.0,
                                  width:50,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Icon(
                                      Icons.date_range_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide( //                    <--- top side
                                          color: Colors.blueAccent,
                                          width: 3.0,
                                        ),
                                      )
                                  ),
                                ),
                                Container(
                                  height: 55.0,
                                  width:155,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 4.0, left: 5.0),
                                    child: Center(
                                      child: Text(
                                        '  Date  ',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 25.0),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide( //                    <--- top side
                                          color: Colors.blueAccent,
                                          width: 3.0,
                                        ),
                                      )
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 4.0, left: 5.0),
                                    child: Center(
                                      child: Text(
                                        snapshot.data.docs[index]['bloodNeedDateController'],
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
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Colors.blueAccent)
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
                    ),
                  );
                });
          }),
    );
  }
}