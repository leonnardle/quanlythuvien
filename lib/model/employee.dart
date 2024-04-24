


class Employee {
  late String id;
  late String name;
  late String email;
  late String password;
  late double salary;
  late int worknumber;
  late String phonenumber;

  Employee();

  factory Employee.fromJson(Map<String, dynamic> data) {
    Employee employee = Employee();
    employee.id = data['manv'] ?? '';
    employee.name = data['tennv'] ?? '';
    employee.email = data['email'] ?? '';
    employee.phonenumber = data['sdt'] ?? '';
    employee.password = data['matkhau'] ?? '';
    employee.worknumber = data['songaycong'] ?? '';
    employee.salary = data['luong'] ?? '';
    return employee;
  }


}
