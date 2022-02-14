import 'package:fiazproject/Plumber/plum_ser_detail.dart';
import 'package:flutter/material.dart';

class PlumberServices extends StatefulWidget {
  const PlumberServices({Key? key}) : super(key: key);

  @override
  _PlumberServicesState createState() => _PlumberServicesState();
}

class _PlumberServicesState extends State<PlumberServices> {
  var avtivity_list = [
    {
      "name": "Water Motor",
      "pic": "images/watermotor.jpg",
      "price": "See List",
      "detail":
          "Plumbers install and repair pipes that supply water and gas to, as well as carry waste away from, "
              "homes and businesses. They also install plumbing fixtures such as bathtubs, sinks, and toilets, "
              "and appliances, including dishwashers and washing machines. "
              "Experienced plumbers train apprentices and supervise helpers. "
              "They work alongside other construction workers."
    },
    {
      "name": "Water Tank",
      "pic": "images/2.jpg",
      "price": "See List",
      "detail":
          "Plumbers install and repair pipes that supply water and gas to, as well as carry waste away from, "
              "homes and businesses. They also install plumbing fixtures such as bathtubs, sinks, and toilets, "
              "and appliances, including dishwashers and washing machines. "
              "Experienced plumbers train apprentices and supervise helpers. "
              "They work alongside other construction workers."
    },
    {
      "name": "Kitchen",
      "pic": "images/kitchen.jpg",
      "price": "See List",
      "detail":
          "Plumbers install and repair pipes that supply water and gas to, as well as carry waste away from, "
              "homes and businesses. They also install plumbing fixtures such as bathtubs, sinks, and toilets, "
              "and appliances, including dishwashers and washing machines. "
              "Experienced plumbers train apprentices and supervise helpers. "
              "They work alongside other construction workers."
    },
    {
      "name": "Bathroom",
      "pic": "images/bathroom.jpg",
      "price": "See List",
      "detail":
          "Plumbers install and repair pipes that supply water and gas to, as well as carry waste away from, "
              "homes and businesses. They also install plumbing fixtures such as bathtubs, sinks, and toilets, "
              "and appliances, including dishwashers and washing machines. "
              "Experienced plumbers train apprentices and supervise helpers. "
              "They work alongside other construction workers."
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
          ),
          itemBuilder: (BuildContext context, int index) {
            return SinglePlumService(
              plum_name: avtivity_list[index]['name'],
              plum_pic: avtivity_list[index]['pic'],
              plum_price: avtivity_list[index]['price'],
              plum_detail: avtivity_list[index]['detail'],
            );
          }),
    );
  }
}

class SinglePlumService extends StatefulWidget {
  // const SinglePlumService({Key? key}) : super(key: key);
  final plum_name;
  final plum_pic;
  final plum_price;
  final plum_detail;

  SinglePlumService({
    this.plum_name,
    this.plum_pic,
    this.plum_price,
    this.plum_detail,
  });

  @override
  _SinglePlumServiceState createState() => _SinglePlumServiceState();
}

class _SinglePlumServiceState extends State<SinglePlumService> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlumberServicesDetail(
                      plum_ser_detail_name: widget.plum_name,
                      plum_ser_detail_pic: widget.plum_pic,
                      plum_ser_detail_price: widget.plum_price,
                      plum_service_detail: widget.plum_detail,
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
              widget.plum_pic,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.plum_name,
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
