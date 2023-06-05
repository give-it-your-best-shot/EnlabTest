import 'package:enlabtest/const/colors.dart';
import 'package:enlabtest/service/quiz_service.dart';
import 'package:enlabtest/widget/quiz_wid.dart';
import 'package:flutter/material.dart';

import '../model/quiz_model.dart';

class ReviewPage extends StatelessWidget {
  List<QuizModel> quizzes = [];
  List<int> answeredIndex = [];
  ReviewPage({super.key, required this.quizzes, required this.answeredIndex});

  @override
  Widget build(BuildContext context) {
    QuizService service = QuizService();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: bgColor,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 30,
                  ))
            ],
          ),
          backgroundColor: bgColor,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: quizzes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: QuizWidShow(
                        quiz: quizzes[index],
                        index: index,
                        maxIndex: quizzes.length,
                        buttonSelectedIndex: answeredIndex[index]),
                  );
                }),
          )),
    );
  }
}
