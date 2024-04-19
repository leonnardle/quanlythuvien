abstract class EmployeeState{}
class EmployeeInitial extends EmployeeState {}
class EmployeeLoading extends EmployeeState{}
class EmployeeLoaded extends EmployeeState{}
class EmployeesLoadError extends EmployeeState {
  final String message;

  EmployeesLoadError(this.message);
}
