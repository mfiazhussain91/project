import 'package:admin_side/Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class userData extends ChangeNotifier {
  late UserModel currentData;

  void getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection('CustomerUserRecord')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        userEmail: value.get("Email"),
        userImage: value.get("userImage"),
        Name: value.get("name"), //"Name In Data Base "

      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData;
  }

  Future<void> updateData(mapData, uid) async {
    await FirebaseFirestore.instance
        .collection('CustomerUserRecord')
        .doc(uid)
        .update(mapData);
    notifyListeners();
  }

  List<UserModel> tailorsData = [];
  List<UserModel> get getAllTailors  {
    UserModel userModel;
    List<UserModel> _newList = [];
    FirebaseFirestore.instance.collection('CustomerUserRecord').get().then((value)
    {
      value.docs.forEach((element) {
        userModel = UserModel(
          userEmail: element.get("email"),
          userImage: element.get("userImage"),
          Name: element.get("name"),

        );
        print("user model is : ${userModel.Name}  ${userModel.userEmail}  ${userModel.userImage}" );
        _newList.add(userModel);
      });
      tailorsData = _newList;
      notifyListeners();
    });
    print("tailorsData is: $tailorsData & _newList is: $_newList");
    return tailorsData;
  }

  List<UserModel> get getTailorsProfile {
    return tailorsData;
  }
}
