import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smarttailor/Provider/product_provider.dart';
import 'package:smarttailor/buttonwidget/orderbutton.dart';
import 'package:smarttailor/colors/appcolors.dart';
import 'package:smarttailor/models/Product_Model.dart';
import 'package:smarttailor/products/edit_product.dart';
import 'package:smarttailor/tailorscreens/3.2____shirt.dart';
import 'package:smarttailor/tailorscreens/female_suiting.dart';
import 'package:smarttailor/tailorscreens/3___malesuiting.dart';

class ShirtDescription extends StatefulWidget {
 ProductModel data;
 ShirtDescription({required this.data});

  @override
  _ShirtDescriptionState createState() => _ShirtDescriptionState();
}

class _ShirtDescriptionState extends State<ShirtDescription> {
  late ProductProvider productProvider;
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    productProvider=Provider.of(context);
    return Scaffold(
      backgroundColor: AppColors.cupCakeColor,
      body: SafeArea(
        child: isLoading==true?Center(child: CircularProgressIndicator(),): Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.data.productImage),
                )
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 90),
                  child: Text(
                    "Price",
                    style: GoogleFonts.lobster(textStyle: TextStyle(color: Colors.black87, fontSize: 20)),
                  ),
                ),
                SizedBox(width: 50),
                Text(
                    widget.data.productPrice.toString(),
                  style: GoogleFonts.knewave(textStyle: TextStyle(color: AppColors.coralColor, fontSize: 25)),
                )
              ],
            ),
            SizedBox(height: 18),
            Text(
                "Yellow Regular Fit Shirt",
              style: GoogleFonts.lemon(textStyle: TextStyle(color: AppColors.electricBlueColor, fontSize: 20)),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                widget.data.productDesc,
              ),
            ),
            SizedBox(height: 40),
            // OrderButton(),

            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditProduct(data: widget.data,)));

                    },
                    shape: StadiumBorder(),
                    splashColor: Colors.black,
                    autofocus: true,
                    color: Colors.green.shade400,
                    child: Text('Edit'),
                  ),
                ),
                SizedBox(width: 10.0,),
                 Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        isLoading=true;
                      });
                        productProvider.deleteProduct(widget.data.userUid).then((value) {
                          widget.data.genderCategory==1? Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => TailorMaleSuiting())):
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => TailorFeMaleSuiting()));

                           });
                    },
                    shape: StadiumBorder(),
                    splashColor: Colors.black,
                    autofocus: true,
                    color: Colors.red,
                    child: Text('Delete'),
                  ),
                )
              ],
            ),
          ],

        ),
      ),
    );
  }
}
