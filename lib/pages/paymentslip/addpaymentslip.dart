import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/model/paymentslip.dart';
import 'package:thuctap/pages/paymentslip/paymentsliplist.dart';
import 'package:thuctap/rest/paymentslip_function.dart';

import '../../components/dropdownbutton.dart';
import '../../rest/getlist_function.dart';
import '../../utils.dart';

class AddPaymentSlip extends StatefulWidget {
   AddPaymentSlip({super.key});
   _AddPaymentSlipState createState() => _AddPaymentSlipState();
}
class _AddPaymentSlipState extends State<AddPaymentSlip> {

  //controller
  late TextEditingController idslipController = TextEditingController();
  PaySlip paySlip=PaySlip();
  late List danhsachmaphieumuon=[];
  late bool _isLoading = true;
  late String? selectedmaphieumuon;
  void getListmaphieumuon()async{
    try {
      _isLoading = true;
      danhsachmaphieumuon = await fetchListName("${Utils.baseUrl}/sachmuon/maphieumuon","maphieu");
      setState(() {
        _isLoading = false; // Đặt trạng thái tải dữ liệu thành false khi đã tải xong
      });
    } catch (e) {
      print('Error fetching loan id: $e');
    }
  }
  //butonadd
  void addphieutra() async{
    paySlip.idSlip=idslipController.text;

    paySlip.idLoan=selectedmaphieumuon!;
    await insertpayslip(paySlip);
    List<PaySlip> list=await fetchpayslip();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ListPaymentSLip(items: list,)));

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListmaphieumuon();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Thêm Phiếu Trả'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/31.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          'Thêm Phiếu Trả',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.yellow[700],
                          ),
                        ),
                        SizedBox(width: 50), // Khoảng cách giữa logo và tiêu đề
                      ],
                    ),
                    SizedBox(height: 20), // Khoảng trống giữa tiêu đề và phần nhập thông tin
                    Container(
                      padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(vertical: 50),
                  decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20), 
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('mã phiếu trả' , style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: idslipController, hintText: 'mã phiếu trả', obScureText: false),
                          const SizedBox(height: 10),
                          Text('mã phiếu mượn' , style: TextStyle(fontWeight: FontWeight.bold)),

                          ListItems(items: danhsachmaphieumuon, onChanged: (newvalue){
                            for(int i=0;i<danhsachmaphieumuon.length;i++){
                              if(equal(danhsachmaphieumuon![i], newvalue)){
                                setState(() {
                                  selectedmaphieumuon=newvalue;
                                });
                              }
                            }
                          },),
                  const SizedBox(height: 10),

                          MyButton(
                            onTap: addphieutra,
                            text: 'Thêm Phiếu Trả',

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
