import 'role.dart';

class Person implements Role{
  Person(this._name, this._age, this._address);
  late String _name;
  late int _age;
  late String _address;

  // Getter Methods
  String get getName => _name;
  int get getAge => _age;
  String get getAddress => _address;

  @override
  void displayRole(){
    print("Role: Person");
  }
}