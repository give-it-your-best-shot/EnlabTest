import 'package:enlabtest/const/colors.dart';
import 'package:flutter/material.dart';

import '../const/text_style.dart';

class ShortButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String? image;
  final Color? txtColor;
  final Color btnColor;
  const ShortButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.image,
    this.txtColor,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.0,
        width: 110,
        decoration: BoxDecoration(
            color: shortButtonColor,
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(0.4),
                blurRadius: 16,
                offset: Offset(7, 6), // Shadow position
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Image.asset(
                'assets/image/$image',
                height: 25.0,
                width: 60.0,
              ),
            Text(
              text,
              style: txtColor != null
                  ? headline2.copyWith(color: txtColor)
                  : headline2,
            )
          ],
        ),
      ),
    );
  }
}
