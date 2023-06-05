import 'package:enlabtest/const/colors.dart';
import 'package:enlabtest/service/quiz_service.dart';
import 'package:enlabtest/view/review_page.dart';
import 'package:enlabtest/view/splash_page.dart';
import 'package:enlabtest/widget/short_button.dart';
import 'package:flutter/material.dart';

import '../model/quiz_model.dart';

class CongratPage extends StatelessWidget {
  QuizService service = QuizService();
  int numOfCorrectAnswer = 0;
  DateTime startTime;
  List<QuizModel> quizzes = [];
  List<int> answeredIndex = [];
  CongratPage(
      {super.key,
      required this.numOfCorrectAnswer,
      required this.startTime,
      required this.quizzes,
      required this.answeredIndex});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgColor,
        body: Center(
            child: Container(
                height: 350,
                width: 350,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(0.6),
                        blurRadius: 35,
                        offset: Offset(20, 20), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(22.0),
                        bottom: Radius.circular(22.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    Image.asset(
                      numOfCorrectAnswer.toDouble() /
                                  quizzes.length.toDouble() >=
                              0.5
                          ? "assets/reward.png"
                          : "assets/refresh.png",
                      height: 120,
                      width: 120,
                    ),
                    Text(
                      numOfCorrectAnswer.toDouble() /
                                  quizzes.length.toDouble() >=
                              0.5
                          ? "Congratulation!!"
                          : "Completed!!",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      numOfCorrectAnswer.toDouble() /
                                  quizzes.length.toDouble() >=
                              0.5
                          ? "You are amazing!!"
                          : "Better luck next time!!",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "${numOfCorrectAnswer}/${quizzes.length} correct answers in ${DateTime.now().difference(startTime).inSeconds} seconds",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShortButton(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen(),
                                  maintainState: true),
                            );
                          },
                          text: "Play again",
                          btnColor: Colors.red,
                          txtColor: Colors.white,
                        ),
                        ShortButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReviewPage(
                                        answeredIndex: answeredIndex,
                                        quizzes: quizzes,
                                      )),
                            );
                          },
                          text: "Review answer",
                          btnColor: Colors.red,
                          txtColor: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ))),
      ),
    );
  }
}
