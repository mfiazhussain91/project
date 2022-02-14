import 'package:admin_side/Models/order_model.dart';
import 'package:admin_side/Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class orderData extends ChangeNotifier {
  late OrderModel currentData;

  void getUserData() async {
    OrderModel orderModel;
    var value = await FirebaseFirestore.instance
        .collection('Orders')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      orderModel = OrderModel(

        userEmail: value.get("Email"),
        userNumber: value.get("Phone Number"),
        Name: value.get("Name"),
        service: value.get("Service"),
        serviceName: value.get("Service Name"),
        userAddress: value.get("address"),
        userProblem: value.get("Problem"),


        // ac: value.get(""),
        // acCompany: value.get(""),
        // acSize: value.get(""),
        // servicePrice: value.get(""),



        //"Name In Data Base "

      );
      currentData = orderModel;
      notifyListeners();
    }
  }

  OrderModel get currentUserData {
    return currentData;
  }

  Future<void> updateData(mapData, uid) async {
    await FirebaseFirestore.instance
        .collection('Orders')
        .doc(uid)
        .update(mapData);
    notifyListeners();
  }

  List<OrderModel> customerData = [];
  List<OrderModel> get getAllCustomers  {
    OrderModel orderModel;
    List<OrderModel> _newList = [];
    FirebaseFirestore.instance.collection('Orders').get().then((value)
    {
      value.docs.forEach((element) {
        orderModel = OrderModel(
          userEmail: element.get("Email"),
          userNumber: element.get("Phone Number"),
          Name: element.get("Name"),
          service: element.get("Service"),
          serviceName: element.get("Service Name"),
          userAddress: element.get("address"),
          userProblem: element.get("Problem"),

          // ac: element.get(""),
          // acCompany: element.get(""),
          // acSize: element.get(""),
          // servicePrice: element.get(""),


        );
        print("user model is : ${orderModel.Name}  ${orderModel.userEmail}  ${orderModel.userNumber}" );
        _newList.add(orderModel);
      });
      customerData = _newList;
      notifyListeners();
    });
    print("tailorsData is: $customerData & _newList is: $_newList");
    return customerData;
  }

  List<OrderModel> get getCustomerProfile {
    return customerData;
  }
}
