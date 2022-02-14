import 'package:flutter/material.dart';
import 'package:blood_donation/sideDraw.dart';


class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: SideDraw(),
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(
          "Blood Donation",

          style: TextStyle(
              color: Colors.white, fontSize: 22.0),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.indigo,
      ),

      body: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
    image: AssetImage(
    "assets/Blood.jpg"),
    fit: BoxFit.cover,
    ),
    ),
        child: Padding(

            padding: EdgeInsets.only(top: 170.0),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            //gridDelegate:

           //SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[

              _buildCard("Request Blood", Icons.add, Colors.red, onTap: (){Navigator.of(context).pushNamed("blood_request");}),
              _buildCard("Donate", Icons.attach_money, Colors.green, onTap: (){Navigator.of(context).pushNamed("donate");}),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Color backgroundColor, {GestureTapCallback onTap}) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        
        height: 90,
        child: Card(
          
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 0.0,
          color: backgroundColor,
          child: InkWell(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(icon, size: 50.0, color: Colors.white,),
                Text(title, style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
