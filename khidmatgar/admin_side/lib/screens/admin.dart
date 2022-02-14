
import 'package:admin_side/screens/admin_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    setState(() => _selectedPage = Page.dashboard);
                  },
                  icon: Icon(
                    Icons.dashboard,
                    color: _selectedPage == Page.dashboard ? active : notActive,
                  ),
                  label: Text(
                    'Dashboard',
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: FlatButton.icon(
                    onPressed: () {
                      setState(() => _selectedPage = Page.manage);
                    },
                    icon: Icon(
                      Icons.sort,
                      color: _selectedPage == Page.manage ? active : notActive,
                    ),
                    label: Text('Manage')),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                signOut().whenComplete(
                  () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage())),
                );
              },
            )
          ],
          elevation: 0.0,
          backgroundColor: Colors.indigo,
        ),
        body: _loadScreen());
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15.0, right: 6.0, left: 10.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.people_outline),
                              label: Text("Users")),
                          subtitle: Text(
                            '7',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15.0, right: 11.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.category),
                              label: Text("Categories")),
                          subtitle: Text(
                            '6',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15.0, right: 6.0, left: 10.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.track_changes),
                              label: Text("Services")),
                          subtitle: Text(
                            '25',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15.0, right: 11.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.tag_faces),
                              label: Text("Sold")),
                          subtitle: Text(
                            '13',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15.0, right: 6.0, left: 10.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.shopping_cart),
                              label: Text("Orders")),
                          subtitle: Text(
                            '5',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 15.0, right: 11.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.close),
                              label: Text("Return")),
                          subtitle: Text(
                            '0',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 50.0),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        break;
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Add Service"),
              // onTap: () {
              //   Navigator.push(context,
              //       // MaterialPageRoute(builder: (_) => AddNewService()));
              // },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("Services list"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Add category"),
              onTap: () {
                // _categoryAlert();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Category list"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.reorder_rounded),
              title: Text("Orders"),
              onTap: () {
                // _brandAlert();
              },
            ),
            Divider(),
          ],
        );
        break;
      default:
        return Container();
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

//   void _categoryAlert() {
//     var alert = new AlertDialog(
//       content: Form(
//         key: _categoryFormKey,
//         child: TextFormField(
//           controller: categoryController,
//           validator: (value) {
//             if (value!.isEmpty) {
//               return 'category cannot be empty';
//             }
//           },
//           decoration: InputDecoration(hintText: "add category"),
//         ),
//       ),
//       actions: <Widget>[
//         FlatButton(
//             onPressed: () {
//               if (categoryController.text != null) {
//                 _categoryService.createCategory(categoryController.text);
//               }
//               Fluttertoast.showToast(msg: 'category created');
//               Navigator.pop(context);
//             },
//             child: Text('ADD')),
//         FlatButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('CANCEL')),
//       ],
//     );
//
//     showDialog(context: context, builder: (_) => alert);
//   }
//
//   void _brandAlert() {
//     var alert = new AlertDialog(
//       content: Form(
//         key: _brandFormKey,
//         child: TextFormField(
//           controller: brandController,
//           validator: (value) {
//             if (value!.isEmpty) {
//               return 'category cannot be empty';
//             }
//           },
//           decoration: InputDecoration(hintText: "add brand"),
//         ),
//       ),
//       actions: <Widget>[
//         FlatButton(
//             onPressed: () {
//               if (brandController.text != null) {
//                 _brandService.createBrand(brandController.text);
//               }
//               Fluttertoast.showToast(msg: 'brand added');
//               Navigator.pop(context);
//             },
//             child: Text('ADD')),
//         FlatButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('CANCEL')),
//       ],
//     );
//
//     showDialog(context: context, builder: (_) => alert);
//   }
}
