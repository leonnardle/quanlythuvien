import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuctap/bloc/employee/employee_event.dart';
import 'package:thuctap/bloc/employee/employee_state.dart';


import 'package:thuctap/model/Employee.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeInitial());

  Stream<EmployeeState> mapEventToState(EmployeeEvent event) async* {

  }
  
  void deleteEmployee(String id) {}
  void addEmployee(Employee Employee) {}
  void editEmployee(String id) {}
  
}

