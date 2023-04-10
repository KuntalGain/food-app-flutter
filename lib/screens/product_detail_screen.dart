import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  String imageId;
  String itemName;
  String itemDescription;
  double price;

  ProductScreen(
      {this.imageId = '',
      this.itemDescription = '',
      this.itemName = '',
      this.price = 0.0});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Image.network(
              widget.imageId,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              width: 150,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: Text(
                      quantity.toString(),
                      style: TextStyle(fontSize: 29, color: Colors.white),
                    ),
                  ),
                  Material(
                    child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (quantity < 1) {
                            quantity = 0;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Value Cannot be Negative',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )));
                          } else {
                            quantity--;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(widget.itemName,
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                    fontSize: 28,
                  ),
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
            child: Text('Item Description',
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                    fontSize: 22,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.itemDescription,
                style: TextStyle(
                  fontSize: 18,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Text(
                  '\$ ${widget.price}',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "Buy",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
