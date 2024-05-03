import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/buttonadd.dart';
import 'package:thuctap/model/paymentslip.dart';
import 'package:thuctap/pages/book/addBook.dart';
import 'package:thuctap/pages/book/editBook.dart';
import 'package:thuctap/pages/paymentslip/addpaymentslip.dart';
import 'package:thuctap/pages/paymentslip/editpaymentslip.dart';
import 'package:thuctap/rest/paymentslip_function.dart';

import '../../function/showDialog.dart';

class ListPaymentSLip extends StatefulWidget {
  late List<PaySlip>? items;

   ListPaymentSLip({Key? key,required this.items});
   _ListPaymentSLipState createState() => _ListPaymentSLipState();
}
class _ListPaymentSLipState extends State<ListPaymentSLip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Danh Sách Phiếu Trả'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/31.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Danh Sách Phiếu Trả',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.yellow[700],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 938,
            right: 0,
            child: Image.asset(
              'assets/images/logo.png',
              width: 50,
              height: 50,
            ),
          ),
          Positioned.fill(
            top: 50,
            child: ListView.builder(
              itemCount: widget.items!.length,
              itemBuilder: (context, index) {
                PaySlip payslip=widget.items![index];
                return GestureDetector(
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phiếu Trả ${index + 1}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text('mã phiếu: ${payslip.idSlip}'),
                                SizedBox(height: 4),
                                Text('Ngày trả: ${payslip.paymentDay}'),
                                SizedBox(height: 4),
                                Text('mã phiêu mượn :  ${payslip.idLoan}'),
                              ],  
                            ),    
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => EditPaymentSlip(book:payslip,)));
                            },
                            icon: Icon(Icons.edit),
                          ),
                           IconButton(
                            onPressed: () {
                              showDeleteConfirmationDialog(context, (confirm) async {
                                if(confirm){
                                  await deletepayslip(widget.items![index]);
                                  PaySlip? book = widget.items?[index];
                                  if (book != null) {
                                    setState(() {
                                      widget.items?.removeAt(index);
                                    });
                                  }

                                }
                              });
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],  
                      ),
                    ),
                  ),
                  onTap: () {
                    // Xử lý sự kiện khi nhấn vào một sách
                  },
                );
              },
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: AddButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPaymentSlip(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
