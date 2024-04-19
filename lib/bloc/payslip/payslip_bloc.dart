import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thuctap/bloc/Payslip/Payslip_event.dart';
import 'package:thuctap/bloc/Payslip/Payslip_state.dart';
import 'package:thuctap/model/paymentslip.dart';


class PayslipBloc extends Bloc<PayslipEvent, PayslipState> {
  PayslipBloc() : super(PayslipInitial());

  Stream<PayslipState> mapEventToState(PayslipEvent event) async* {

  }
  
  void deletePayslip(String id) {}
  void addPayslip(PaySlip p) {}
  void editPayslip(String id) {}
  
}