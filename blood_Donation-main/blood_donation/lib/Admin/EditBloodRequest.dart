import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class editbloodrequest extends StatefulWidget {
  DocumentSnapshot docToEdit;
  editbloodrequest({this.docToEdit});

  @override
  _editbloodrequestState createState() => _editbloodrequestState();
}
bool isRequesting = false;
final _formKey = GlobalKey<FormState>();

class _editbloodrequestState extends State<editbloodrequest> {


  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController bloodNeedDateController = TextEditingController();


  final ref = FirebaseFirestore.instance.collection('bloodrequest');
  @override

  void initState() {
    addressController = TextEditingController(text: widget.docToEdit['addressController']);
    amountController = TextEditingController(text: widget.docToEdit['amountController']);
    phoneNumberController = TextEditingController(text: widget.docToEdit['phoneNumberController']);
    bloodGroupController = TextEditingController(text: widget.docToEdit['bloodGroupController']);
    bloodNeedDateController = TextEditingController(text: widget.docToEdit['bloodNeedDateController']);

    super.initState();
  }

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
        actions: [
          FlatButton(
              onPressed: () {

                if (_formKey.currentState.validate()) {

                  widget.docToEdit.reference.update({
                    'addressController': addressController.text,
                    'amountController': amountController.text,
                    'phoneNumberController': phoneNumberController.text,
                    'bloodGroupController': bloodGroupController.text,
                    'bloodNeedDateController': bloodNeedDateController.text,

                  });
                  handleBloodRequest();
                }
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
                            )
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
                            )
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
                            )
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

                        ),
                        controller: bloodNeedDateController,
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
