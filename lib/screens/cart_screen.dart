import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCartScreen extends StatelessWidget {
  final List<Product> myCart;
  const MyCartScreen({super.key, required this.myCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(9),
      child: ListView.builder(
          itemCount: myCart.length,
          itemBuilder: (ctx, i) {
            return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 130,
                      width: 130,
                      color: Colors.black,
                      child: Image.network(
                        myCart[i].imageId,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Text(myCart[i].itemName,
                              style: GoogleFonts.pacifico(
                                textStyle: TextStyle(fontSize: 20),
                              )),
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 20),
                            Text(
                              '\$${(myCart[i].price * myCart[i].quantity).toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              myCart[i].quantity.toString(),
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ));
          }),
    );
  }
}
