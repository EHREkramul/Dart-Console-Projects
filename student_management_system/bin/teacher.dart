import 'person.dart';

class Teacher extends Person{
  Teacher(super.name, super.age, super.address, this._teacherID, this._coursesTaught);

  late final int _teacherID;
  late List<String> _coursesTaught;

  // Getter Methods
  int get getTeacherID => _teacherID;
  
  
  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void courseTaughtByTeacher(){
    print('Courses Taught:');
    for(var course in _coursesTaught){
      print('- $course');
    }
  }
}