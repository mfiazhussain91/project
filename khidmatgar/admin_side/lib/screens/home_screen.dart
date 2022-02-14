import 'package:admin_side/Orders/orders.dart';
import 'package:admin_side/Users/users.dart';
import 'package:admin_side/screens/MyDrawer.dart';
import 'package:admin_side/Users/colors.dart';
import 'package:admin_side/screens/admin_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Admin Dashboard",
          style: GoogleFonts.pollerOne(
              textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          )),
        ),
      ),
      backgroundColor: AppColors.cupCakeColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 18.0, right: 10.0, left: 10.0),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Users()));
                      },
                      child: Card(
                        child: ListTile(
                            title: FlatButton.icon(
                                onPressed: null,
                                icon: Icon(
                                  Icons.people_outline,
                                  color: Colors.indigo,
                                ),
                                label: Text("Users")),
                            subtitle: Text(
                              'Users',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Orders()));
                      },
                      child: Card(
                        child: ListTile(
                            title: FlatButton.icon(
                                onPressed: null,
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.indigo,
                                ),
                                label: Text("Orders")),
                            subtitle: Text(
                              'Orders',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        showAboutDialog(
                          context: context,
                          applicationName: "Khidmatgar",
                          applicationVersion: "0.0.1",
                          applicationLegalese:
                              "Developed by Ali Ahmad and Fiaz Hussain",
                          applicationIcon: Icon(
                            Icons.help_outline_outlined,
                            size: 55,
                            color: Colors.indigo,
                          ),
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("App Information"),
                            Text("App Privacy Policy"),
                            Text("App Terms of Policy"),
                          ],
                        );
                      },
                      child: Card(
                        child: ListTile(
                            title: FlatButton.icon(
                                onPressed: null,
                                icon: Icon(
                                  Icons.info_outline_rounded,
                                  color: Colors.indigo,
                                ),
                                label: Text("About App")),
                            subtitle: Text(
                              'About App',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26.0),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Card(
                        child: ListTile(
                            title: FlatButton.icon(
                                onPressed: null,
                                icon: Icon(
                                  Icons.logout_outlined,
                                  color: Colors.indigo,
                                ),
                                label: Text("Logout")),
                            subtitle: Text(
                              'Logout',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../db/category.dart';
// import '../db/brand.dart';
//
// enum Page { dashboard, manage }
//
// class Admin extends StatefulWidget {
//   @override
//   _AdminState createState() => _AdminState();
// }
//
// class _AdminState extends State<Admin> {
//   Page _selectedPage = Page.dashboard;
//   MaterialColor active = Colors.red;
//   MaterialColor notActive = Colors.grey;
//   TextEditingController categoryController = TextEditingController();
//   TextEditingController brandController = TextEditingController();
//   GlobalKey<FormState> _categoryFormKey = GlobalKey();
//   GlobalKey<FormState> _brandFormKey = GlobalKey();
//   BrandService _brandService = BrandService();
//   CategoryService _categoryService = CategoryService();
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Row(
//             children: <Widget>[
//               Expanded(
//                   child: FlatButton.icon(
//                       onPressed: () {
//                         setState(() => _selectedPage = Page.dashboard);
//                       },
//                       icon: Icon(
//                         Icons.dashboard,
//                         color: _selectedPage == Page.dashboard
//                             ? active
//                             : notActive,
//                       ),
//                       label: Text('Dashboard'))),
//               Expanded(
//                   child: FlatButton.icon(
//                       onPressed: () {
//                         setState(() => _selectedPage = Page.manage);
//                       },
//                       icon: Icon(
//                         Icons.sort,
//                         color:
//                         _selectedPage == Page.manage ? active : notActive,
//                       ),
//                       label: Text('Manage'))),
//             ],
//           ),
//           elevation: 0.0,
//           backgroundColor: Colors.white,
//         ),
//         body: _loadScreen());
//   }
//
//   Widget _loadScreen() {
//     switch (_selectedPage) {
//       case Page.dashboard:
//         return Column(
//           children: <Widget>[
//             ListTile(
//               subtitle: FlatButton.icon(
//                 onPressed: null,
//                 icon: Icon(
//                   Icons.attach_money,
//                   size: 30.0,
//                   color: Colors.green,
//                 ),
//                 label: Text('12,000',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 30.0, color: Colors.green)),
//               ),
//               title: Text(
//                 'Revenue',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 24.0, color: Colors.grey),
//               ),
//             ),
//             Expanded(
//               child: GridView(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2),
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(18.0),
//                     child: Card(
//                       child: ListTile(
//                           title: FlatButton.icon(
//                               onPressed: null,
//                               icon: Icon(Icons.people_outline),
//                               label: Text("Users")),
//                           subtitle: Text(
//                             '7',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(color: active, fontSize: 60.0),
//                           )),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(18.0),
//                     child: Card(
//                       child: ListTile(
//                           title: FlatButton.icon(
//                               onPressed: null,
//                               icon: Icon(Icons.category),
//                               label: Text("Categories")),
//                           subtitle: Text(
//                             '23',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(color: active, fontSize: 60.0),
//                           )),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(22.0),
//                     child: Card(
//                       child: ListTile(
//                           title: FlatButton.icon(
//                               onPressed: null,
//                               icon: Icon(Icons.track_changes),
//                               label: Text("Producs")),
//                           subtitle: Text(
//                             '120',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(color: active, fontSize: 60.0),
//                           )),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(22.0),
//                     child: Card(
//                       child: ListTile(
//                           title: FlatButton.icon(
//                               onPressed: null,
//                               icon: Icon(Icons.tag_faces),
//                               label: Text("Sold")),
//                           subtitle: Text(
//                             '13',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(color: active, fontSize: 60.0),
//                           )),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(22.0),
//                     child: Card(
//                       child: ListTile(
//                           title: FlatButton.icon(
//                               onPressed: null,
//                               icon: Icon(Icons.shopping_cart),
//                               label: Text("Orders")),
//                           subtitle: Text(
//                             '5',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(color: active, fontSize: 60.0),
//                           )),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(22.0),
//                     child: Card(
//                       child: ListTile(
//                           title: FlatButton.icon(
//                               onPressed: null,
//                               icon: Icon(Icons.close),
//                               label: Text("Return")),
//                           subtitle: Text(
//                             '0',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(color: active, fontSize: 60.0),
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//         break;
//       case Page.manage:
//         return ListView(
//           children: <Widget>[
//             ListTile(
//               leading: Icon(Icons.add),
//               title: Text("Add product"),
//               onTap: () {},
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.change_history),
//               title: Text("Products list"),
//               onTap: () {},
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.add_circle),
//               title: Text("Add category"),
//               onTap: () {
//                 _categoryAlert();
//               },
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.category),
//               title: Text("Category list"),
//               onTap: () {},
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.add_circle_outline),
//               title: Text("Add brand"),
//               onTap: () {
//                 _brandAlert();
//               },
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.library_books),
//               title: Text("brand list"),
//               onTap: () {},
//             ),
//             Divider(),
//           ],
//         );
//         break;
//       default:
//         return Container();
//     }
//   }
//
//   // void _categoryAlert() {
//   //   var alert = new AlertDialog(
//   //     content: Form(
//   //       key: _categoryFormKey,
//   //       child: TextFormField(
//   //         controller: categoryController,
//   //         validator: (value){
//   //           if(value.isEmpty){
//   //             return 'category cannot be empty';
//   //           }
//   //         },
//   //         decoration: InputDecoration(
//   //             hintText: "add category"
//   //         ),
//   //       ),
//   //     ),
//   //     actions: <Widget>[
//   //       FlatButton(onPressed: (){
//   //         if(categoryController.text != null){
//   //           _categoryService.createCategory(categoryController.text);
//   //         }
//   //         Fluttertoast.showToast(msg: 'category created');
//   //         Navigator.pop(context);
//   //       }, child: Text('ADD')),
//   //       FlatButton(onPressed: (){
//   //         Navigator.pop(context);
//   //       }, child: Text('CANCEL')),
//   //
//   //     ],
//   //   );
//   //
//   //   showDialog(context: context, builder: (_) => alert);
//   // }
//   //
//   // void _brandAlert() {
//   //   var alert = new AlertDialog(
//   //     content: Form(
//   //       key: _brandFormKey,
//   //       child: TextFormField(
//   //         controller: brandController,
//   //         validator: (value){
//   //           if(value.isEmpty){
//   //             return 'category cannot be empty';
//   //           }
//   //         },
//   //         decoration: InputDecoration(
//   //             hintText: "add brand"
//   //         ),
//   //       ),
//   //     ),
//   //     actions: <Widget>[
//   //       FlatButton(onPressed: (){
//   //         if(brandController.text != null){
//   //           _brandService.createBrand(brandController.text);
//   //         }
//   //         Fluttertoast.showToast(msg: 'brand added');
//   //         Navigator.pop(context);
//   //       }, child: Text('ADD')),
//   //       FlatButton(onPressed: (){
//   //         Navigator.pop(context);
//   //       }, child: Text('CANCEL')),
//   //
//   //     ],
//   //   );
//   //
//   //   showDialog(context: context, builder: (_) => alert);
//   // }
// }
