import 'dart:developer';

import 'package:enlabtest/const/colors.dart';
import 'package:enlabtest/model/quiz_model.dart';
import 'package:enlabtest/service/quiz_service.dart';
import 'package:enlabtest/view/congrat_page.dart';
import 'package:enlabtest/view/splash_page.dart';
import 'package:enlabtest/widget/quiz_wid.dart';
import 'package:flutter/material.dart';

import '../widget/long_button.dart';

class QuizPage extends StatefulWidget {
  //static int numberOfCorrectAns = 0;
  int numOfQuiz;
  int currentIndex = 0;
  List<QuizModel> quizzes = [];
  List<int> answeredIndex = [];
  QuizPage({super.key, required this.numOfQuiz});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizService service = QuizService();
  DateTime startTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    service.getQuiz(this.widget.numOfQuiz).then((value) {
      setState(() {
        this.widget.quizzes = value;
        this.widget.answeredIndex = List.generate(value.length, (index) => -1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.quizzes.isEmpty)
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreen(),
                            maintainState: true),
                        (Route<dynamic> route) => false);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 30,
                  ))
            ],
          ),
          body: Center(
              child: Image.asset(
            "assets/loading.png",
            height: 60,
            width: 60,
          )),
        ),
      );
    QuizWid quizWid = QuizWid(
        quiz: this.widget.quizzes[this.widget.currentIndex],
        index: this.widget.currentIndex,
        maxIndex: this.widget.quizzes.length);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              backgroundColor: bgColor,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreen(),
                              maintainState: true),
                          (Route<dynamic> route) => false);
                    },
                    icon: Icon(Icons.close, size: 30))
              ],
            ),
            body: this.widget.quizzes.length == 0
                ? Column()
                : Column(
                    children: [
                      quizWid,
                      NextButton(
                          txt: this.widget.currentIndex ==
                                  this.widget.quizzes.length - 1
                              ? "Finish"
                              : "Next",
                          onTap: () {
                            this
                                    .widget
                                    .answeredIndex[this.widget.currentIndex] =
                                quizWid.buttonSelectedIndex as int;
                            if (this.widget.currentIndex <
                                this.widget.quizzes.length - 1)
                              setState(() {
                                this.widget.currentIndex++;
                              });
                            else {
                              int numOfCorrectAns = 0;

                              for (int i = 0;
                                  i < this.widget.quizzes.length;
                                  i++) {
                                if (this.widget.answeredIndex[i] == -1)
                                  continue;
                                if (this.widget.quizzes[i].allQuiz![
                                        this.widget.answeredIndex[i]] ==
                                    this.widget.quizzes[i].correct_answer)
                                  numOfCorrectAns++;
                              }
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CongratPage(
                                            numOfCorrectAnswer: numOfCorrectAns,
                                            startTime: startTime,
                                            quizzes: this.widget.quizzes,
                                            answeredIndex:
                                                this.widget.answeredIndex,
                                          ),
                                      maintainState: true),
                                  (Route<dynamic> route) => false);
                            }
                          })
                    ],
                  )));
  }
}
