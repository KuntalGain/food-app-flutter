import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/screens/main_screen/app_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutScreen extends StatelessWidget {
  final List<Product> orderedItems;
  const CheckOutScreen({super.key, required this.orderedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  'Assets/check.jpg',
                ),
                radius: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Thank You Very Much ,\n Your Order will be delivered shortly',
                style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                )),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: orderedItems.length,
                    itemBuilder: (ctx, i) => Container(
                          margin: EdgeInsets.all(5),
                          height: 80,
                          width: 80,
                          child: Image.network(
                            orderedItems[i].imageId,
                            fit: BoxFit.cover,
                          ),
                        ))),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3),
                        color: Colors.grey,
                        blurRadius: 3,
                        spreadRadius: 3,
                      )
                    ]),
                child: Text(
                  'New Order',
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
