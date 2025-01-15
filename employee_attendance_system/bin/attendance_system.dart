import 'employee.dart';

class EmployeeAttendanceSystem{
  final Set<Employee> _employees = {};


  void addEmployee(Employee employee) {
    if (_employees.any((e) => e.getId == employee.getId)) {
      print('Employee with ID ${employee.getId} already exists.');
    }else{
      _employees.add(employee);
      print('Employee ${employee.name} added successfully.');
    }
  }

  void markAttendance(int id, DateTime date, String status){
    if (status != 'Present' && status != 'Absent') {
      print('Invalid attendance status.');
      return;
    }
    Employee employee;
    try{
      employee = _employees.firstWhere((emp) => emp.getId == id);
    }catch(e){
      print("No Employee Found");
      return;
    }

    employee.attendance[date] = status;
    print('Attendance marked for ${employee.name} on $date: $status');
  }


  void attendanceHistory(int id){
    Employee employee;
    try{
      employee = _employees.firstWhere((emp) => emp.getId == id);
    }catch(e){
      print("No Employee Found");
      return;
    }

    print('Attendance History of Employee: ${employee.name}');
    for(var att in employee.attendance.entries){
      print('Date: ${att.key}  --  Attendance Status: ${att.value}');
    }
  }

  double _calculateAttendancePercentage(int id){
    Employee employee;
    try{
      employee = _employees.firstWhere((emp) => emp.getId == id);
    }catch(e){
      print("No Employee Found");
      return -1;
    }

    int attendanceCount = employee.attendance.length;
    var presentAttendanceEntries = employee.attendance.entries.where((atn)=>atn.value=='Present');
    int presentCount = presentAttendanceEntries.length;

    double percentage = (presentCount/attendanceCount)*100;
    return percentage;
  }


  void attendancePercentageOfEmployees(){
    if(_employees.isEmpty){
      print('No employee exist');
      return;
    }

    for(var employee in _employees){
      print('Attendance Percentage of Employee with ID ${employee.getId} is: ${_calculateAttendancePercentage(employee.getId)}');
    }
  }
}