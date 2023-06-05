import 'package:enlabtest/const/colors.dart';
import 'package:enlabtest/view/congrat_page.dart';
import 'package:enlabtest/view/quiz_page.dart';
import 'package:enlabtest/widget/short_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgColor,
        body: Center(
          child: Column(children: [
            SizedBox(
              height: 280,
            ),
            Container(
              decoration: BoxDecoration(
                  color: shortButtonColor,
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87.withOpacity(0.6),
                      blurRadius: 20,
                      offset: Offset(10, 8), // Shadow position
                    ),
                  ]),
              child: Image.asset(
                "assets/robot_logo.png",
                width: 130,
                height: 130,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ShortButton(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizPage(numOfQuiz: 5),
                        maintainState: true),
                    (Route<dynamic> route) => false);
              },
              text: "Start 5 Quiz!",
              btnColor: shortButtonColor,
              txtColor: Colors.white,
            ),
            SizedBox(
              height: 12,
            ),
            ShortButton(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizPage(numOfQuiz: 10),
                        maintainState: true),
                    (Route<dynamic> route) => false);
              },
              text: "Start 10 Quiz!",
              btnColor: shortButtonColor,
              txtColor: Colors.white,
            ),
            SizedBox(
              height: 12,
            ),
            ShortButton(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizPage(numOfQuiz: 20),
                        maintainState: true),
                    (Route<dynamic> route) => false);
              },
              text: "Start 20 Quiz!",
              btnColor: shortButtonColor,
              txtColor: Colors.white,
            )
          ]),
        ),
      ),
    );
  }
}
