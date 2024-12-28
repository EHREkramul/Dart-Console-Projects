import 'dart:io';

import 'question.dart';
// late String questionText;
// late List<String> options;
// late int correctOptionIndex;
// late double points;
class Quiz{
  late List<Question> questions = [];


  addQuestion(String questionText, List<String> options, int correctOptionIndex, double points){
    var newQuestion = Question(questionText, options, correctOptionIndex, points);
    questions.add(newQuestion);
  }
  double startQuiz(){
    if(questions.isEmpty) return -1;


    double score = 0;
    int? selectedIndex = -1;

    for(var question in questions){
      print(question.getQuestionText);
      for(int i=0; i<question.getOptions.length;i++){
        print('${i+1}. ${question.getOptions[i]}');
      }

      while(true){
        stdout.write('Select the correct option : ');
        selectedIndex = int.tryParse(stdin.readLineSync()!);

        if(selectedIndex == null){
          print('Select a valid answer.');
        }else{
          selectedIndex--;
          break;
        }
      }

      if(selectedIndex == question.getCorrectOptionIndex){
        score += question.getPoints;
      }
    }

    return score;
  }
}