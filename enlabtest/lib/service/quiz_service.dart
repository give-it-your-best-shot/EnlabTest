import 'dart:convert';

import 'package:enlabtest/model/quiz_model.dart';
import 'package:enlabtest/service/config.dart';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';
import 'package:permission_handler/permission_handler.dart';

class QuizService {
  Future<List<QuizModel>> getQuiz(int numberOfQuiz) async {
    Map<String, dynamic> params = {"amount": '${numberOfQuiz.toString()}'};
    final uri = Uri.https(api_url, "/api.php", params);
    try {
      print(uri);
      var response = await http
          .get(uri, headers: {"Accept": "application/json;charset=UTF-8"});
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
