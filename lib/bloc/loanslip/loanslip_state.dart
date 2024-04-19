abstract class LoanslipState{}
class LoanslipInitial extends LoanslipState {}
class LoanslipLoading extends LoanslipState{}
class LoanslipLoaded extends LoanslipState{}
class LoanslipsLoadError extends LoanslipState {
  final String message;

  LoanslipsLoadError(this.message);
}
