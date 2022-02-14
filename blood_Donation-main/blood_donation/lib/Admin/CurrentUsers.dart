import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'EditBloodRequest.dart';
import 'EditDoners.dart';
import 'EditUsers.dart';

class CurrentUser extends StatelessWidget {

  final ref = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
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
                              builder: (_) => Users(
                                docToEdit: snapshot.data.docs[index],
                              )));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 90,

                      child: Column(
                        children: [
                          Container(
                            height: 90,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 80,
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
                                        snapshot.data.docs[index]['BloodGroup'],
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

                            height: 5.0,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black54,width: 3.0),
                              ),
                            ),
                          ),
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
                                        snapshot.data.docs[index]['Username'],
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
                            height: 90,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 90,
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
                                  height: 80,
                                  width:155,
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 4.0, left: 5.0),
                                    child: Center(
                                      child: Text(
                                        'E m a i l',
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
                                        snapshot.data.docs[index]['Email'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18.0),
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
                                        snapshot.data.docs[index]['Gender'],
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
                        ],
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