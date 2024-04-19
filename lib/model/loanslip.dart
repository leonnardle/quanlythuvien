class LoanSlip {
  final String idSlip;
  final String readerName;
  final String idBook;
  final bool status;
  final DateTime loanDay;
  final DateTime paymentDay; 


  LoanSlip({required this.idSlip,required this.readerName,required this.idBook,required this.status,required this.loanDay, required this.paymentDay
  });
}
