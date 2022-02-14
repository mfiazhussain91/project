import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  DocumentSnapshot docToEdit;
  Users({this.docToEdit});
  @override
  _UsersState createState() => _UsersState();
}
bool isRequesting = false;
final _formKey = GlobalKey<FormState>();

class _UsersState extends State<Users> {

  TextEditingController Username = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController BloodGroup = TextEditingController();
  TextEditingController Gender = TextEditingController();

  final ref = FirebaseFirestore.instance.collection('Donate');

  @override

  void initState() {
    Username = TextEditingController(text: widget.docToEdit['Username']);
    Email = TextEditingController(text: widget.docToEdit['Email']);
    Password = TextEditingController(text: widget.docToEdit['Password']);
    BloodGroup = TextEditingController(text: widget.docToEdit['BloodGroup']);
    Gender = TextEditingController(text: widget.docToEdit['Gender']);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton(
                onPressed: () {

                  widget.docToEdit.reference.update({
                    'Username': Username.text,
                    'Email': Email.text,
                    'BloodGroup': BloodGroup.text,
                    'Gender': Gender.text,


                  }).whenComplete(() => Navigator.pop(context));
                },
                child: Text('Update')),
            FlatButton(
                onPressed: () {
                  widget.docToEdit.reference.delete().whenComplete(() => Navigator.pop(context));

                },
                child: Text('Delete'))
          ],
          backgroundColor: Colors.indigo,
        ),
        body: Builder(builder: (context){
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/Blood.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'What is your sweet name?';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,
                            hintText: "Your FullName",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                        controller: Username,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        width: 250.0,
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter email like :example@gmail.com';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white.withOpacity(0.6),
                              filled: true,
                              labelText: 'Email',
                              hintText: 'example@gmail.com',
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: Colors.black,
                              ),
                              errorStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          controller:  Email,
                        ),
                      ),
                    ),

                    Row(
                      children: <Widget>[
                        Flexible(
                          child: DropdownButtonFormField(
                            validator: (value) => value == null
                                ? 'Plz Provide Blood Group' : null,
                            onChanged: (val){
                              BloodGroup.text = val;
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.white.withOpacity(0.6),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                            hint: Text("Blood Group"),
                            items: [
                              DropdownMenuItem(child: Text("A+"),
                                value: "A+",),
                              DropdownMenuItem(child: Text("B+"),
                                value: "B+",),
                              DropdownMenuItem(child: Text("O+"),
                                value: "O+",),
                              DropdownMenuItem(child: Text("AB+"),
                                value: "AB+",),
                              DropdownMenuItem(child: Text("A-"),
                                value: "A-",),
                              DropdownMenuItem(child: Text("B-"),
                                value: "B-",),
                              DropdownMenuItem(child: Text("O-"),
                                value: "O-",),
                              DropdownMenuItem(child: Text("AB-"),
                                value: "AB-",),
                            ],
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Flexible(
                          child: DropdownButtonFormField(
                            validator: (value) => value == null
                                ? 'Please provide Gender' : null,
                            onChanged: (val){
                              Gender.text = val;
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.white.withOpacity(0.6),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                            hint: Text("Choose your Sex"),
                            items: [
                              DropdownMenuItem(child: Text("Male"),
                                value: "Male",),
                              DropdownMenuItem(child: Text("Female"),
                                value: "Female",),
                              DropdownMenuItem(child: Text("Other"),
                                value: "Other",),
                            ],
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
          );
        })
    );
  }
}
