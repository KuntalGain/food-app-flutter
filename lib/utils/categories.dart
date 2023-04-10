import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget foodItems(String imageId, String foodName, double price) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(20),
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodName,
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                '\$${price}',
                style: TextStyle(fontSize: 13, color: Colors.orange),
              ),
              Text('30min', style: TextStyle(fontSize: 8, color: Colors.grey))
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 75,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  imageId,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
