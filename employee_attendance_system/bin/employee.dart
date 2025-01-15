class Employee{
  Employee(this._id, this.name, this.designation);

  final int _id;
  final String name;
  final String designation;
  final Map<DateTime, String> attendance = {};

  int get getId => _id;
}