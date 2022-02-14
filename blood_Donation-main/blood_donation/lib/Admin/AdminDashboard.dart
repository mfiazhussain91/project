import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Admindraw.dart';

class AdminPanel extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminDrawer(),
        appBar: AppBar(

        title: Text('Admin Dashboard'),
              backgroundColor: Colors.indigo,
                ),

                  

  );
}
}