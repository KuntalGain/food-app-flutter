import 'package:flutter/material.dart';

// make items

Widget makeTiles(IconData icon, String stringId,
    TextEditingController controller, bool isHidden) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 23),
    padding: EdgeInsets.all(8),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      border: Border.all(
        color: Colors.black,
        width: 1,
      ),
    ),
    child: Row(
      children: [
        Icon(icon),
        SizedBox(width: 18),
        Expanded(
          child: TextField(
            obscureText: isHidden,
            controller: controller,
            decoration: InputDecoration(
              labelText: stringId,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}
