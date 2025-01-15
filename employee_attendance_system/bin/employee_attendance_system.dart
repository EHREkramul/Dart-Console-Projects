import 'attendance_system.dart';
import 'employee.dart';

void main() {
  EmployeeAttendanceSystem attendanceSystem = EmployeeAttendanceSystem();

  attendanceSystem.addEmployee(Employee(1, 'John Doe', 'Developer'));
  attendanceSystem.addEmployee(Employee(2, 'Jane Smith', 'Manager'));

  attendanceSystem.markAttendance(1, DateTime.now(), 'Present');
  attendanceSystem.markAttendance(2, DateTime.now(), 'Absent');


  attendanceSystem.attendanceHistory(1);
  attendanceSystem.attendancePercentageOfEmployees();
}
