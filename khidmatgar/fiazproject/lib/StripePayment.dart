// import 'dart:convert';
// import 'package:deliverers/Models/userModel.dart';
// import 'package:deliverers/services/database.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_stripe/flutter_stripe.dart';
//
//
// class StripePayment extends StatefulWidget {
//   final String email;
//   final String payeremail;
//   final String jobId;
//   final String bidId;
//   final UserModel bidderModel;
//   const StripePayment({Key key, this.email, this.jobId, this.bidderModel, this.payeremail, this.bidId}) : super(key: key);
//
//   @override
//   _StripePaymentState createState() => _StripePaymentState();
// }
//
// class _StripePaymentState extends State<StripePayment> {
//
//   bool isPressed = false;
//   showAlertDialog(BuildContext context, String message) {
//     // set up the button
//     Widget okButton = FlatButton(
//       child: Text("OK"),
//       onPressed: () {
//         // if (isVerified) {
//         isPressed = false;
//         Navigator.pop(context);
//         setState(() {});
//         // } else {
//         //   isPressed = false;
//         //   Navigator.pop(context);
//         // }
//       },
//     );
//
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Sorry!"),
//       content: Text(message),
//       actions: [
//         okButton,
//       ],
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
//
//   Map<String, dynamic> paymentIntentData;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//         icon: Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Colors.green,
//           ),
//             onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//
//         title: Text(
//             'Payment',
//           style:TextStyle(
//             color:Colors.green,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 height: 50,
//               ),
//               Image.asset(
//                 'images/logo.png',
//                 height: 250,
//                 width: 200,
//               ),
//         Container(
//           padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
//           child: Column(children: <Widget>[
//             Container(
//               height: 40.0,
//               color: Colors.transparent,
//               child: InkWell(
//                 onTap: () async {
//                   await makePayment();
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           color: Colors.black,
//                           style: BorderStyle.solid,
//                           width: 1.0),
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(20.0)),
//                   child: Center(
//                     child: Text(
//                       'Make a Payment',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Montserrat',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ]
//           ),
//         ),
//       ]),
//       ),
//     );
//   }
//
//   Future<void> makePayment() async {
//     try {
//
//       paymentIntentData =
//       await createPaymentIntent('', ''); //json.decode(response.body);
//       // print('Response body==>${response.body.toString()}');
//       await Stripe.instance.initPaymentSheet(
//           paymentSheetParameters: SetupPaymentSheetParameters(
//               paymentIntentClientSecret: paymentIntentData['client_secret'],
//               applePay: true,
//               googlePay: true,
//               testEnv: true,
//               style: ThemeMode.dark,
//               merchantCountryCode: 'US',
//               merchantDisplayName: 'ANNIE')).then((value){
//       });
//
//
//       ///now finally display payment sheeet
//       displayPaymentSheet();
//     } catch (e, s) {
//       print('exception:$e$s');
//     }
//   }
//
//   displayPaymentSheet() async {
//
//     try {
//       await Stripe.instance.presentPaymentSheet(
//           parameters: PresentPaymentSheetParameters(
//             clientSecret: paymentIntentData['client_secret'],
//             confirmPayment: true,
//           )).then((newValue){
//
//
//         print('payment intent'+paymentIntentData['id'].toString());
//         print('payment intent'+paymentIntentData['client_secret'].toString());
//         print('payment intent'+paymentIntentData['amount'].toString());
//         print('payment intent'+paymentIntentData.toString());
//         //orderPlaceApi(paymentIntentData!['id'].toString());
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Paid Successfully")));
//         print("widget.email is: ${widget.email}  "
//             "widget.jobId is: ${widget.jobId}  "
//             "widget.bidderModel is: ${widget.bidderModel}");
//         DatabaseMethods().jobUndertakeUpdateToDB
//           (widget.email, widget.jobId, widget.bidderModel).then((value) async {
//             if (value == 'Success') {
//               print("value in Success on StripePayment in then of jobUndertakeUpdateToDB"
//                   " is: $value");
//               await DatabaseMethods().addPaymentInfoToDB
//                 (widget.payeremail, widget.bidderModel.emailId, widget.jobId,
//                 widget.bidId, paymentIntentData['id'].toString(),
//                   paymentIntentData['amount'].toString(),
//                   paymentIntentData['currency'].toString() );
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The job got assigned.")));
//               showAlertDialog(context, 'The job got assigned.');
//             }
//             else{
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The job did not get assigned.")));
//               showAlertDialog(context, 'The job did not get assigned.'
//                   ' And value is: $value');
//
//             }
//         });
//
//         paymentIntentData = null;
//
//       }).onError((error, stackTrace){
//         print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
//       });
//
//
//     } on StripeException catch (e) {
//       print('Exception/DISPLAYPAYMENTSHEET==> $e');
//       showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//             content: Text("Cancelled "),
//           ));
//     } catch (e) {
//       print('$e');
//     }
//   }
//
//   //  Future<Map<String, dynamic>>
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(''),
//         'currency': currency,
//         'payment_method_types[]': 'card'
//       };
//       print(body);
//       var response = await http.post(
//           Uri.parse(''),
//           body: body,
//           headers: {
//             'Authorization':
//             '',
//             'Content-Type': ''
//           });
//       print('Create Intent reponse ===> ${response.body.toString()}');
//
//       return jsonDecode(response.body);
//     } catch (err) {
//       print('err charging user: ${err.toString()}');
//     }
//   }
//
//   calculateAmount(String amount) {
//     final a = (int.parse(amount)) * 100 ;
//     return a.toString();
//   }
//
// }