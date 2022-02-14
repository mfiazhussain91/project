import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'main.dart';



class RequestBlood extends StatefulWidget {

  @override
  _RequestBloodState createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {

  bool isRequesting = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController addressController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController bloodNeedDateController = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('bloodrequest');

  handleBloodRequest() async {
    setState(() {
      isRequesting = true;
    });



    setState(() {
      isRequesting = false;
      Navigator.pop(context);
    });
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
        bloodNeedDateController.text = date.year.toString() +"-"+ date.month.toString() +"-"+date.day.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Request Blood"),
        ),
        body: Builder(builder: (context){
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/Blood.jpg"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
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
                            return 'Donor needs your Address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,

                            hintText: "Address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorStyle: TextStyle(color: Colors.black),
                        ),
                        controller: addressController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Blood Amount is Required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,
                            hintText: "Blood Amount (in Pin)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          errorStyle: TextStyle(color: Colors.black),
                        ),
                        controller: amountController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        validator: (value) {
                          if (value.isEmpty || value.length!=11) {
                            return 'Provide 11 Digit Number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,
                            hintText: "Phone Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          errorStyle: TextStyle(color: Colors.black),
                        ),
                        controller: phoneNumberController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: DropdownButtonFormField(
                        validator: (value) => value == null
                            ? 'Please provide Blood Group' : null,
                        onChanged: (val){
                          bloodGroupController.text = val;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          errorStyle: TextStyle(color: Colors.black),
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
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: TextFormField(
                        onTap: (){
                          pickDate();
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Provide Date';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,
                            hintText: "When Do you Need?",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          errorStyle: TextStyle(color: Colors.black),
                        ),
                        controller: bloodNeedDateController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                          child: Text("Request Blood", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              ref.add({
                                'addressController': addressController.text,
                                'amountController': amountController.text,
                                'phoneNumberController': phoneNumberController.text,
                                'bloodGroupController': bloodGroupController.text,
                                'bloodNeedDateController': bloodNeedDateController.text,
                              });
                              handleBloodRequest();
                            }

                          }
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

