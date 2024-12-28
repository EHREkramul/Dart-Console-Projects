import 'person.dart';

class Student extends Person{
  Student(super.name, super.age, super.address,this._studentID, this._courseScores);

  late final int _studentID;
  late double _grade;
  late List<double> _courseScores;

  // Getter Methods
  int get getStudentID => _studentID;
  double get getGrade => _grade;

  @override
  void displayRole() {
    print('Role: Student');
  }

  double getAverageScore(){
    double totalScore = _courseScores.reduce((a,b) => a+b);
    double averageScore = totalScore/_courseScores.length;

    return averageScore;
  }
}