import 'dart:developer';

import 'package:enlabtest/const/colors.dart';
import 'package:enlabtest/model/quiz_model.dart';
import 'package:enlabtest/service/quiz_service.dart';
import 'package:enlabtest/widget/quiz_wid.dart';
import 'package:flutter/material.dart';


import '../widget/long_button.dart';

class QuizPage extends StatefulWidget {
  //static int numberOfCorrectAns = 0;
  QuizService service = QuizService();
  int currentIndex = 0;
  List<QuizModel> quizzes = [];
  QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizService service = QuizService();

  @override
  void initState() {
    super.initState();
    service.getQuiz(20).then((value) {
      setState(() {
        this.widget.quizzes = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              backgroundColor: bgColor,
              elevation: 0,
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.close))],
            ),
            body: this.widget.quizzes.length == 0
                ? Text("No")
                : Column(
                    children: [
                      QuizWid(
                          quiz: this.widget.quizzes[this.widget.currentIndex],
                          index: this.widget.currentIndex,
                          maxIndex: this.widget.quizzes.length),
                      NextButton(
                          txt: this.widget.currentIndex ==
                                  this.widget.quizzes.length - 1
                              ? "Finish"
                              : "Next",
                          onTap: () {
                            setState(() {
                              if (this.widget.currentIndex <
                                  this.widget.quizzes.length - 1)
                                this.widget.currentIndex++;
                            });
                          })
                    ],
                  )));
  }
}
