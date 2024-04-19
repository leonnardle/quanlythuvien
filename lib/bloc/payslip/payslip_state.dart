abstract class PayslipState{}
class PayslipInitial extends PayslipState {}
class PayslipLoading extends PayslipState{}
class PayslipLoaded extends PayslipState{}
class PayslipsLoadError extends PayslipState {
  final String message;

  PayslipsLoadError(this.message);
}
