import 'package:flutter/material.dart';
import 'mason_ser_detail.dart';

class MasonServices extends StatefulWidget {
  const MasonServices({Key? key}) : super(key: key);

  @override
  _MasonServicesState createState() => _MasonServicesState();
}

class _MasonServicesState extends State<MasonServices> {
  var avtivity_list = [
    {
      "name": "Construction",
      "pic": "images/house.jpg",
      "price": "See List",
      "detail": "The mason works under direction and performs all general masonry work involved in the maintenance and "
          "construction of block, stone, and brick structures; constructs and repairs concrete structures; "
          "works with various machine and hand tools common to the masonry trade; "
          "may prepare or work from sketches, plans, and specifications in accord with the "
          "building code or accepted trade practices and gives suitable"
          " assignments to those assigned as helpers."
    },
    {
      "name": "Modification",
      "pic": "images/hmodi.jpg",
      "price": "See List",
      "detail": "The mason works under direction and performs all general masonry work involved in the maintenance and "
          "construction of block, stone, and brick structures; constructs and repairs concrete structures; "
          "works with various machine and hand tools common to the masonry trade; "
          "may prepare or work from sketches, plans, and specifications in accord with the "
          "building code or accepted trade practices and gives suitable"
          " assignments to those assigned as helpers."
    },
    {
      "name": "Plaster",
      "pic": "images/plaster.jpg",
      "price": "See List",
      "detail": "Masons can expect to work in all weather and with various materials,"
          " lift and carry heavy objects, and read and assess technical drawings. "
          "Their responsibilities include texturing and polishing blocks of stone, installing dressed stone,"
          " mixing cement and mortar, and restoring old and damaged masonry works."
    },
    {
      "name": "Floor repairs",
      "pic": "images/floor.jpg",
      "price": "See List",
      "detail": "Masons can expect to work in all weather and with various materials,"
          " lift and carry heavy objects, and read and assess technical drawings. "
          "Their responsibilities include texturing and polishing blocks of stone, installing dressed stone,"
          " mixing cement and mortar, and restoring old and damaged masonry works."
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: avtivity_list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 1,
            crossAxisSpacing: 0,
            // childAspectRatio: 0.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return SingleMasonService(
              mas_name: avtivity_list[index]['name'],
              mas_pic: avtivity_list[index]['pic'],
              mas_price: avtivity_list[index]['price'],
              mas_detail: avtivity_list[index]['detail'],
            );
          }),
    );
  }
}

class SingleMasonService extends StatefulWidget {
  // const SingleMasonService({Key? key}) : super(key: key);
  final mas_name;
  final mas_pic;
  final mas_price;
  final mas_detail;

  SingleMasonService({
    this.mas_name,
    this.mas_pic,
    this.mas_price,
    this.mas_detail,
  });

  @override
  _SingleMasonServiceState createState() => _SingleMasonServiceState();
}

class _SingleMasonServiceState extends State<SingleMasonService> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MasonServicesDetail(
                      mas_ser_detail_name: widget.mas_name,
                      mas_ser_detail_pic: widget.mas_pic,
                      mas_ser_detail_price: widget.mas_price,
                      mas_service_detail: widget.mas_detail,
                    )));
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            height: 70.0,
            width: 70.0,
            child: Image.asset(
              widget.mas_pic,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.mas_name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
      // child: Image.asset(
      //   widget.elect_pic,
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
