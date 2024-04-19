abstract class RegisState {}

class RegisInitial extends RegisState {}

class RegisLoading extends RegisState {}

class RegisSuccess extends RegisState {}

class RegisFailure extends RegisState {
  final String error;

  RegisFailure({required this.error});
}