import 'student.dart';
import 'teacher.dart';

void main() {
  // Instance of Student
  Student student = new Student('John Doe', 20, '123 Main Street', 1, [90, 85, 82]);

  print('Student Information:');
  student.displayRole();
  print('Name: ${student.getName}');
  print('Age: ${student.getAge}');
  print('Address: ${student.getAddress}');
  print('Average Score: ${student.getAverageScore().toStringAsPrecision(4)}\n\n');


  // Instance of Teacher Class
  Teacher teacher = Teacher('Mrs. Smith', 35, '456 Oak St.', 1, ['Math', 'English', 'Bangla']);

  print('Teacher Information:');
  teacher.displayRole();
  print('Name: ${teacher.getName}');
  print('Age: ${teacher.getAge}');
  print('Address: ${teacher.getAddress}');
  teacher.courseTaughtByTeacher();
}
