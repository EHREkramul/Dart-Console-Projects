import 'dart:io';

import 'quiz.dart';

void main(){
  Quiz quiz = Quiz();

  quiz.addQuestion(
      "What is the capital of France?",
      ["Paris", "London", "Berlin", "Madrid"],
      0, // Correct option index (Paris)
      25 // Points
  );

  quiz.addQuestion(
      "Which programming language is used for Flutter development?",
      ["Java", "Dart", "Python", "C++"],
      1, // Correct option index (Dart)
      25 // Points
  );

  quiz.addQuestion(
      "What is the largest planet in our Solar System?",
      ["Earth", "Mars", "Jupiter", "Venus"],
      2, // Correct option index (Jupiter)
      25 // Points
  );

  quiz.addQuestion(
      "Who wrote the novel '1984'?",
      ["George Orwell", "J.K. Rowling", "Mark Twain", "Jane Austen"],
      0, // Correct option index (George Orwell)
      25 // Points
  );


  double result = -1;

  double totalScore = 0;
  for(int i=0; i<quiz.questions.length; i++){
    totalScore += quiz.questions[i].getPoints;
  }
  while(true){
    result = quiz.startQuiz();

    if(result == -1){
      print('No Question Available for Quiz');
      break;
    }

    if(result < totalScore/2){
      print('Your total Quiz Score is: $result');
      print('Your Score is less than 50 percent. Do you want to retake?');
      stdout.write('Write yes/no: ');
      String? option = stdin.readLineSync();

      if(option!.toLowerCase() == 'no'){
        break;
      }
    }
    else{
      print('Your total Quiz Score is: $result');
      break;
    }
  }
}