import 'dart:convert';

import 'package:enlabtest/model/quiz_model.dart';
import 'package:enlabtest/service/config.dart';
import 'package:http/http.dart' as http;

import 'package:permission_handler/permission_handler.dart';

class QuizService {
  Future<List<QuizModel>> getQuiz(int numberOfQuiz) async {
    Map<String, dynamic> params = {"amount": '20'};
    final uri = Uri.https(api_url, "/api.php", params);
    try {
      print(uri);
      var response = await http.get(uri, headers: {
        "Accept":
            "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"
      });
      var json = jsonDecode(response.body);
      List<QuizModel> quizs = [];
      for (var jsonQuiz in json["results"])
        quizs.add(QuizModel.fromJson(jsonQuiz));
      return quizs;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
