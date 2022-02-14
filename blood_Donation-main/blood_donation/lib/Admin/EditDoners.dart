import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class editDonors extends StatefulWidget {
  DocumentSnapshot docToEdit;
  editDonors({this.docToEdit});

  @override
  _editDonorsState createState() => _editDonorsState();
}
bool isRequesting = false;
final _formKey = GlobalKey<FormState>();

class _editDonorsState extends State<editDonors> {


  TextEditingController NameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateController = TextEditingController();


  final ref = FirebaseFirestore.instance.collection('Donate');

  @override

  void initState() {
    NameController = TextEditingController(text: widget.docToEdit['NameController']);
    addressController = TextEditingController(text: widget.docToEdit['addressController']);
    phoneNumberController = TextEditingController(text: widget.docToEdit['phoneNumberController']);
    bloodGroupController = TextEditingController(text: widget.docToEdit['bloodGroupController']);
    genderController = TextEditingController(text: widget.docToEdit['genderController']);
    dateController = TextEditingController(text: widget.docToEdit['dateController']);
    super.initState();
  }

  pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year+1),
    );

    if(date !=null){
      setState(() {
        dateController.text = date.year.toString() +"-"+ date.month.toString() +"-"+date.day.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton(
                onPressed: () {

                    widget.docToEdit.reference.update({
                      'NameController': NameController.text,
                      'addressController': addressController.text,
                      'phoneNumberController': phoneNumberController.text,
                      'bloodGroupController': bloodGroupController.text,
                      'genderController': genderController.text,
                      'dateController': dateController.text,

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
                        controller: NameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Reciever needs your Address!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,

                            hintText: "Your Address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                        controller: addressController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty || value.length!=11) {
                            return 'Common! Number cannot be Empty';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,
                            hintText: "Phone Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                        controller: phoneNumberController,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: DropdownButtonFormField(
                            validator: (value) => value == null
                                ? 'Plz Provide Blood Group' : null,
                            onChanged: (val){
                              bloodGroupController.text = val;
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
                              genderController.text = val;
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
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please provide Date!!';
                          }
                          return null;
                        },
                        onTap: (){
                          pickDate();
                        },
                        decoration: InputDecoration(
                            hintText: "Date",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          fillColor: Colors.white.withOpacity(0.6),
                          filled: true,
                        ),
                        controller: dateController,
                      ),
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
