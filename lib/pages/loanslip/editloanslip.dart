import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/model/loanslip.dart';
import 'package:thuctap/rest/loanslip_function.dart';

import '../../components/dropdownbutton.dart';
import '../../rest/getlist_function.dart';
import '../../utils.dart';
import 'loansliplist.dart';

class EditLoanSlip extends StatefulWidget {
  LoanSlip book;

  EditLoanSlip({super.key,required this.book});
_EditLoanSlipState createState() => _EditLoanSlipState();
}

class _EditLoanSlipState extends State<EditLoanSlip> {
  //controller
  late  TextEditingController LoanDayController = TextEditingController();
  late List danhsachmadocgia=[];
  late List danhsachmasach=[];
  late bool _isLoading = true;
  late DateTime _selectedloanDate = DateTime.now(); // Khởi tạo biến với ngày hiện tại
  late String? selectedmasach,selectedstatus,selectedmadocgia;
  //butonadd
  void addphieumuon() async{
  widget.book.loanDay=_selectedloanDate!.toString();
  widget.book.idreader=selectedmadocgia!;
  widget.book.idBook=selectedmasach!;
  await updateloanslip(widget.book);
  List<LoanSlip> list=await fetchloanslip();
  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListLoanSlip(items: list,)));

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
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
  void getListmatacgia()async{
    try {
      _isLoading = true;
      danhsachmadocgia = await fetchListName("${Utils.baseUrl}/madocgia","madocgia");
      setState(() {
        _isLoading = false; // Đặt trạng thái tải dữ liệu thành false khi đã tải xong
      });
    } catch (e) {
      print('Error fetching loan id: $e');
    }
  }
  void getListmasach()async{
    try {
      _isLoading = true;
      danhsachmasach = await fetchListName("${Utils.baseUrl}/sachmuon/masach","masach");
      setState(() {
        _isLoading = false; // Đặt trạng thái tải dữ liệu thành false khi đã tải xong
      });
    } catch (e) {
      print('Error fetching loan id: $e');
    }
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getListmatacgia();
    getListmasach();
    LoanDayController=TextEditingController(text: widget.book.loanDay);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Sửa Thông Tin Phiếu Mượn'),
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
                          'Sửa Thông Tin Phiếu Mượn',
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
                          Text('mã Đọc Giả' , style: TextStyle(fontWeight: FontWeight.bold)),
                          ListItems(items: danhsachmadocgia, onChanged: (newvalue){
                            for(int i=0;i<danhsachmadocgia.length;i++){
                              if(equal(danhsachmadocgia![i], newvalue)){
                                setState(() {
                                  selectedmadocgia=newvalue;
                                });
                              }
                            }
                          },),
                          const SizedBox(height: 10),
                          Text('Mã Sách' , style: TextStyle(fontWeight: FontWeight.bold)),
                          ListItems(items: danhsachmasach, onChanged: (newvalue){
                            for(int i=0;i<danhsachmasach.length;i++){
                              if(equal(danhsachmasach![i], newvalue)){
                                setState(() {
                                  selectedmasach=newvalue;
                                });
                              }
                            }
                          },),
                          const SizedBox(height: 10),
                          Text('Ngày Mượn' , style: TextStyle(fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: () {
                              _selectDate(context,LoanDayController,_selectedloanDate!);
                            },
                            child: AbsorbPointer(
                              child: MyTextField(
                                controller: LoanDayController,
                                hintText: 'ngày mượn',
                                obScureText: false,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),
                  const SizedBox(height: 10),

                          MyButton(
                          onTap: addphieumuon,
                          text: 'Sửa Thông Tin Phiếu Mượn',

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
