import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/screens/checkout_screen/checkout_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  final List<Product> orderedProducts;

  const PaymentScreen({super.key, required this.orderedProducts});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // controllers
  final cardNumberController = TextEditingController();
  final addressController = TextEditingController();
  final cvvController = TextEditingController();
  final expiryDateController = TextEditingController();

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (picked != null && picked != _selectDate) {
      setState(() {
        _selectedDate = picked;
        expiryDateController.text = DateFormat('MM/yy').format(picked);
      });
    }
  }

  String cardNumber = '';
  String address = '';
  String expiryDate = '';
  String cvv = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Payment Details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: TextField(
              controller: cardNumberController,
              decoration: InputDecoration(
                label: Text('Card Number'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                label: Text('Shipping Address'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: TextField(
                        controller: expiryDateController,
                        decoration: InputDecoration(
                          label: Text('Expiry date'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: TextField(
                    obscureText: true,
                    controller: cvvController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('CVV'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 80),
          Container(
            margin: EdgeInsets.all(25),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.orange,
            ),
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  cardNumber = cardNumberController.text;
                  address = addressController.text;
                  expiryDate = expiryDateController.text;
                  cvv = cvvController.text;

                  print(
                      '{card : $cardNumber\nAddr : $address\nExpiry : $expiryDate\nCvv : $cvv}');

                  if (cvv.length > 3) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Invalid CVV'),
                    ));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CheckOutScreen(
                            orderedItems: widget.orderedProducts)));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Ordered Successfully'),
                    ));
                  }

                  // clear
                  cardNumberController.clear();
                  addressController.clear();
                  expiryDateController.clear();
                  cvvController.clear();
                });
              },
              child: Text(
                'Place Order',
                style: GoogleFonts.dmSans(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
