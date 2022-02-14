
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class EditProfile extends StatefulWidget {



  EditProfile();

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final _formKey = GlobalKey<FormState>();
  bool isRequesting = false;

  TextEditingController NameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dateController = TextEditingController();

   CollectionReference ref = FirebaseFirestore.instance.collection('Donate');

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
        dateController.text = date.year.toString() +"-"+ date.month.toString() +"-"+date.day.toString();
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Thank You Hero!!"),
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
                    Center(
                      child: CircleAvatar(

                        radius: 50.0,
                      ),
                    ),
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
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
                            ),
                          errorStyle: TextStyle(color: Colors.black),
                        ),
                        controller: addressController,
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
                            ),
                          errorStyle: TextStyle(color: Colors.black),
                        ),
                        controller: phoneNumberController,
                        onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
                                ),
                              errorStyle: TextStyle(color: Colors.black),
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
                            fillColor: Colors.white.withOpacity(0.6),
                            filled: true,
                            hintText: "Date",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          errorStyle: TextStyle(color: Colors.black),
                        ),
                        controller: dateController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                          child: Text("I am Ready to Donate", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              if (_formKey.currentState.validate()) {
                                ref.add({
                                  'NameController': NameController.text,
                                  'addressController': addressController.text,
                                  'phoneNumberController': phoneNumberController.text,
                                  'bloodGroupController': bloodGroupController.text,
                                  'genderController': genderController.text,
                                  'dateController': dateController.text,
                                });
                                handleBloodRequest();
                              }

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
