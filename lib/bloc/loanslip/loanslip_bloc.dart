import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuctap/bloc/loanslip/loanslip_event.dart';
import 'package:thuctap/bloc/loanslip/loanslip_state.dart';
import 'package:thuctap/model/Loanslip.dart';


class LoanslipBloc extends Bloc<LoanslipEvent, LoanslipState> {
  LoanslipBloc() : super(LoanslipInitial());

  Stream<LoanslipState> mapEventToState(LoanslipEvent event) async* {

  }
  
  void deleteLoanslip(String id) {}
  void addLoanslip(LoanSlip loanslip) {}
  void editLoanslip(String id) {}
  
}