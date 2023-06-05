import 'dart:ui';

import 'package:enlabtest/const/colors.dart';
import 'package:enlabtest/const/text_style.dart';
import 'package:flutter/material.dart';

Widget LongButton(
    {required String txt,
    required Color color,
    required Function() onTap,
    required num selected,
    required IconData icon}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.only(left: 18, right: 18),
      margin: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: color)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              txt,
              style: TextStyle(fontSize: 13, color: color),
            ),
          ),
          Icon(
            icon,
            size: 25,
            color: color,
          ),
        ],
      ),
    ),
  );
}

Widget NextButton({required String txt, required Function() onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: shortButtonColor),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: shortButtonColor,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.3),
                  blurRadius: 13,
                  spreadRadius: 5.0,
                  offset: Offset(9, 12), // Shadow position
                ),
              ]),
          width: 245,
          child: Text(
            txt,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        )),
  );
}
