import 'package:enlabtest/const/colors.dart';
import 'package:enlabtest/const/text_style.dart';
import 'package:enlabtest/model/quiz_model.dart';
import 'package:enlabtest/widget/long_button.dart';
import 'package:flutter/material.dart';

class QuizWid extends StatefulWidget {
  QuizModel quiz;
  num index;
  num maxIndex;
  num buttonSelectedIndex;
  QuizWid(
      {super.key,
      required this.quiz,
      required this.index,
      required this.maxIndex,
      this.buttonSelectedIndex = -1});

  @override
  State<QuizWid> createState() => _QuizWidState();
}

class _QuizWidState extends State<QuizWid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(children: [
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Question ${this.widget.index + 1}",
              style: headline,
            ),
            Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  "/${this.widget.maxIndex}",
                  style: headline1,
                ),
              ],
            )
          ],
        )),
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(right: 15, left: 15),
          child: Center(
            child: Text("${this.widget.quiz.question}",
                style: headline1, maxLines: 3),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ...List.generate(
          this.widget.quiz.allQuiz?.length ?? 0,
          (index) => LongButton(
              selected: -1,
              txt: this.widget.quiz.allQuiz![index],
              color: index == this.widget.buttonSelectedIndex
                  ? (this.widget.quiz.correct_answer ==
                          this.widget.quiz.allQuiz![index])
                      ? Colors.green
                      : Colors.red
                  : littleWhite,
              icon: index == this.widget.buttonSelectedIndex
                  ? (this.widget.quiz.correct_answer ==
                          this.widget.quiz.allQuiz![index])
                      ? Icons.check
                      : Icons.close
                  : Icons.circle_outlined,
              onTap: () {
                setState(() {
                  if (this.widget.buttonSelectedIndex == -1)
                    this.widget.buttonSelectedIndex = index;
                });
              }),
        ),
        SizedBox(
          height: 40,
        ),
      ]),
    );
  }
}

class QuizWidShow extends StatefulWidget {
  QuizModel quiz;
  num index;
  num maxIndex;
  num buttonSelectedIndex;
  QuizWidShow(
      {super.key,
      required this.quiz,
      required this.index,
      required this.maxIndex,
      this.buttonSelectedIndex = -1});

  @override
  State<QuizWidShow> createState() => _QuizWidShowState();
}

class _QuizWidShowState extends State<QuizWidShow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 0.3,
          width: 300,
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(children: [
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Question ${this.widget.index + 1}",
                  style: headline,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "/${this.widget.maxIndex}",
                      style: headline1,
                    ),
                  ],
                )
              ],
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(right: 15, left: 15),
              child: Center(
                child: Text("${this.widget.quiz.question}",
                    style: headline1, maxLines: 3),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ...List.generate(
              this.widget.quiz.allQuiz?.length ?? 0,
              (index) => LongButton(
                  selected: -1,
                  txt: this.widget.quiz.allQuiz![index],
                  color: (index == this.widget.buttonSelectedIndex &&
                          this.widget.quiz.correct_answer !=
                              this.widget.quiz.allQuiz![index])
                      ? Colors.red
                      : this.widget.quiz.allQuiz![index] ==
                              this.widget.quiz.correct_answer
                          ? Colors.green
                          : littleWhite,
                  icon: (index == this.widget.buttonSelectedIndex &&
                          this.widget.quiz.correct_answer !=
                              this.widget.quiz.allQuiz![index])
                      ? Icons.close
                      : this.widget.quiz.allQuiz![index] ==
                              this.widget.quiz.correct_answer
                          ? Icons.check
                          : Icons.circle_outlined,
                  onTap: () {
                    setState(() {
                      if (this.widget.buttonSelectedIndex == -1)
                        this.widget.buttonSelectedIndex = index;
                    });
                  }),
            ),
            SizedBox(
              height: 40,
            ),
          ]),
        ),
      ],
    );
  }
}
