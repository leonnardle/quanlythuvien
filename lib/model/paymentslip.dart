import 'Loanslip.dart';

class PaySlip {
  late String idSlip;
  late String paymentDay;
  late String idLoan;


  PaySlip();
  factory PaySlip.fromJson(Map<String, dynamic> data){
    PaySlip paySlip=PaySlip();
    paySlip.idSlip=data["maphieu"];
    paySlip.paymentDay= parseDateTime(data['ngaytra'])?.toString() ?? '';
    paySlip.idLoan=data["maphieumuon"];
    return paySlip;
  }

}
