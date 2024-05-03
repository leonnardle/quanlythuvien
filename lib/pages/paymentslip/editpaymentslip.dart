import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/model/paymentslip.dart';
import 'package:thuctap/pages/paymentslip/paymentsliplist.dart';
import 'package:thuctap/rest/paymentslip_function.dart';

import '../../components/dropdownbutton.dart';
import '../../rest/getlist_function.dart';
import '../../utils.dart';

class EditPaymentSlip extends StatefulWidget {
  PaySlip book;

  EditPaymentSlip({super.key,required this.book});
 _EditPaymentSlipState createState() => _EditPaymentSlipState();
}
class _EditPaymentSlipState extends State<EditPaymentSlip> {
  late  TextEditingController payDayController = TextEditingController();

  //controller
  late List danhsachmaphieumuon=[];
  late bool _isLoading = true;
  late String? selectedmaphieumuon;
  late DateTime _selectedpayDate=DateTime.now();
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
  Future<void> _selectDate(BuildContext context,TextEditingController controller,DateTime dateTime) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != dateTime) {
      setState(() {
        dateTime = picked;
        payDayController.text = picked.toString();
      });
    }
  }
  //butonadd
  void editphieutra() async{
  widget.book.paymentDay=payDayController.text;
  widget.book.idLoan=selectedmaphieumuon.toString();
  print(payDayController.text);
  await updatepayslip(widget.book);
  List<PaySlip> list=await fetchpayslip();
  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListPaymentSLip(items: list,)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    payDayController=TextEditingController(text:widget.book.paymentDay);
    getListmaphieumuon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Sửa Phiếu Trả'),
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
                          'Sửa Phiếu Trả',
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
                          Text('Ngày tra' , style: TextStyle(fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: () {
                              _selectDate(context,payDayController,_selectedpayDate!);
                            },
                            child: AbsorbPointer(
                              child: MyTextField(
                                controller: payDayController,
                                hintText: 'ngày mượn',
                                obScureText: false,
                              ),
                            ),
                          ),
                  const SizedBox(height: 10),

                          MyButton(
                            onTap: editphieutra,
                            text: 'Sửa Phiếu Trả',

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
