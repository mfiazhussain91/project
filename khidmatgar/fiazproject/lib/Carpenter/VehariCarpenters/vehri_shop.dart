import 'package:fiazproject/Carpenter/VehariCarpenters/vehari_shop_detail.dart';
import 'package:fiazproject/Home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehariCarpenters extends StatefulWidget {
  const VehariCarpenters({Key? key}) : super(key: key);

  @override
  _VehariCarpentersState createState() => _VehariCarpentersState();
}

class _VehariCarpentersState extends State<VehariCarpenters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: Text(
            "Providers List",
            style: GoogleFonts.pollerOne(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                )),
            textScaleFactor: 1,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: Icon(Icons.arrow_back_ios_outlined),

          )
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShopDetail()));
              //   _men.getTailorPriceData(_data.uid).then((value) {
              //      _female.getTailorPriceData(_data.uid).then((value) {
              //        Navigator.push(
              //            context,
              //            MaterialPageRoute(
              //                builder: (context) => TailorProfilePage(
              //                      data: _data,
              //                    )));
              //     });
              //    }
              //
              //    );
            },

            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 125,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.white,
                  Colors.indigo.shade400,

                ]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.1, 0.1),
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              gradient: LinearGradient(colors: [
                                Colors.indigo,
                                Colors.white.withOpacity(0.8),
                              ]),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0.1, 0),
                                  blurRadius: 10,
                                )
                              ]),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                " Shop Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Icon(Icons.carpenter_outlined,
                                color: Colors.indigo,),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              gradient: LinearGradient(colors: [
                                Colors.indigo,
                                Colors.white.withOpacity(0.8),
                              ]),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0.1, 0),
                                  blurRadius: 10,
                                )
                              ]),
                          child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                "Stylish furniture Mart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
