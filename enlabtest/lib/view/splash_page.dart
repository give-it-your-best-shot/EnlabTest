import 'package:enlabtest/const/colors.dart';
import 'package:enlabtest/widget/short_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: Column(children: [
            SizedBox(
              height: 250,
            ),
            Image.asset(
              "assets/robot_logo.png",
              width: 200,
              height: 220,
            ),
            ShortButton(
              onTap: () {},
              text: "Start Quiz!",
              btnColor: shortButtonColor,
              txtColor: Colors.white,
            )
          ]),
        ),
      ),
    );
  }
}
