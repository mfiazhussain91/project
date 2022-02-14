import 'package:admin_side/Models/order_model.dart';
import 'package:admin_side/Models/order_model_detail.dart';
import 'package:admin_side/Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class orderDetailData extends ChangeNotifier {
  late OrderModelDetail currentData;

  void getUserData() async {
    OrderModelDetail orderModelDetail;
    var value = await FirebaseFirestore.instance
        .collection('Orders')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      orderModelDetail = OrderModelDetail(
        userEmail: value.get("Email"),
        userNumber: value.get("Phone Number"),
        Name: value.get("Name"),
        ac: '',
        servicePrice: '',
        userAddress: value.get("address"),
        acCompany: '',
        service: value.get("Service"),
        acSize: '',
        userProblem: value.get("Problem"),
        serviceName: value.get("Service Name"),
        //"Name In Data Base "

      );
      currentData = orderModelDetail;
      notifyListeners();
    }
  }

  OrderModelDetail get currentUserData {
    return currentData;
  }

  Future<void> updateData(mapData, uid) async {
    await FirebaseFirestore.instance
        .collection('Orders')
        .doc(uid)
        .update(mapData);
    notifyListeners();
  }

  List<OrderModelDetail> customerData = [];
  List<OrderModelDetail> get getAllCustomers  {
    OrderModelDetail orderModelDetail;
    List<OrderModelDetail> _newList = [];
    FirebaseFirestore.instance.collection('Orders').get().then((value)
    {
      value.docs.forEach((element) {
        orderModelDetail = OrderModelDetail(
          userEmail: element.get("Email"),
          userNumber: element.get("Phone Number"),
          Name: element.get("Name"),
          service: element.get("Service"),
          acSize: '',
          serviceName: element.get("Service Name"),
          ac: '',
          userProblem: element.get("Problem"),
          acCompany: '',
          userAddress: element.get("address"),
          servicePrice: '',

        );
        print("user model is : "
            "${orderModelDetail.Name}  "
            "${orderModelDetail.userEmail}  "
            "${orderModelDetail.userNumber}  "
            "${orderModelDetail.service} "
            " ${orderModelDetail.serviceName} "
            " ${orderModelDetail.acSize} "
            " ${orderModelDetail.ac} "
            " ${orderModelDetail.acCompany}  "
            "${orderModelDetail.userProblem} "
            " ${orderModelDetail.userAddress} "
            " ${orderModelDetail.servicePrice} ");
        _newList.add(orderModelDetail);
      });
      customerData = _newList;
      notifyListeners();
    });
    print("CustomersData is: $customerData & _newList is: $_newList");
    return customerData;
  }

  List<OrderModelDetail> get getCustomerProfile {
    return customerData;
  }
}
