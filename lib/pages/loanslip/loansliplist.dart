import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/buttonadd.dart';
import 'package:thuctap/pages/loanslip/addloanslip.dart';
import 'package:thuctap/pages/loanslip/editloanslip.dart';
import 'package:thuctap/rest/loanslip_function.dart';

import '../../function/showDialog.dart';
import '../../model/loanslip.dart';

class ListLoanSlip extends StatefulWidget {
  late List<LoanSlip>? items;

   ListLoanSlip({Key? key,required this.items});
   _ListLoanSlipState createState() => _ListLoanSlipState();
}

class _ListLoanSlipState extends State<ListLoanSlip> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Danh Sách Phiếu Mượn'),
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
                'Danh Sách Phiếu Mượn',
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
                LoanSlip loanslip=widget.items![index];
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
                                  'Phiếu Mượn ${index + 1}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('mã phiếu: ${loanslip.id}'),
                                SizedBox(height: 4),
                                Text('mã Đọc Giả:  ${loanslip.idreader}'),
                                SizedBox(height: 4),
                                Text('Mã Sách:  ${loanslip.idBook}'),
                                SizedBox(height: 4),
                                Text('Ngày Mượn:  ${loanslip.loanDay}'),
                                
                              ],  
                            ),    
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => EditLoanSlip(book: loanslip,)));
                            },
                            icon: Icon(Icons.edit),
                          ),
                           IconButton(
                            onPressed: () {
                              // Xử lý sự kiện xóa sách
                              showDeleteConfirmationDialog(context, (confirm) async {
                                if(confirm){
                                  await deleteloanslip(widget.items![index]);
                                  LoanSlip? book = widget.items?[index];
                                  if (book != null) {
                                    setState(() {
                                      widget.items?.removeAt(index);
                                    });
                                  }

                                }
                              }

                              );},
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
                    builder: (context) => AddLoanSlip(),
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
