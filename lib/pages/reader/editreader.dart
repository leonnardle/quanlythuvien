import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thuctap/components/dropdownbutton.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/pages/reader/readerlist.dart';

import '../../model/reader.dart';
import '../../rest/reader_function.dart';

class EditReader extends StatefulWidget {
  Reader reader;
   EditReader({super.key,required this.reader});
_EditReaderState createState() => _EditReaderState();
}

class _EditReaderState extends State<EditReader> {
  //controller
  late TextEditingController nameReaderController = TextEditingController();
  late TextEditingController emailReaderController = TextEditingController();
  late TextEditingController phoneReaderController = TextEditingController();
  late List danhsachphieu=[];
  late bool _isLoading = true;
  String? selectedloan;
  //butonadd
  void adddocgia()async{
  if(selectedloan!=null){

    widget.reader.loanId=selectedloan!;
    widget.reader.phonenumber=phoneReaderController.text;
    widget.reader.email=emailReaderController.text;
    widget.reader.name=nameReaderController.text;
    await updatereader(widget.reader);
    List<Reader>list=await fetchreaders();
    Navigator.push(context, MaterialPageRoute(builder: (context) =>ListReader(items: list) ));
  }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.reader.id);
    nameReaderController=TextEditingController(text: widget.reader.name);
    emailReaderController=TextEditingController(text: widget.reader.email);
    phoneReaderController=TextEditingController(text: widget.reader.phonenumber);
    getList();
    print(widget.reader.id);

  }
  void getList() async {
    try {
      danhsachphieu = await fetchLoanId();
      setState(() {
        _isLoading = false; // Đặt trạng thái tải dữ liệu thành false khi đã tải xong
      });
    } catch (e) {
      print('Error fetching loan id: $e');
    }
  }
 @override
  void dispose() {
    // TODO: implement dispose
   nameReaderController.dispose();
   emailReaderController.dispose();
   phoneReaderController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Sửa Thông Tin Đọc Giả'),
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
                          'Sửa Thông Tin Đọc Giả',
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
                  Text('Tên Đọc Giả' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: nameReaderController, hintText: 'Tên Nhà Xuất bản', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Email' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: emailReaderController, hintText: 'Tên Khu Vực', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Số Điện Thoại' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: phoneReaderController, hintText: 'Tên Khu Vực', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Phiếu Mượn' , style: TextStyle(fontWeight: FontWeight.bold)),
                  ListItems(items: danhsachphieu, onChanged: (newvalue){
                  for(int i=0;i<danhsachphieu.length;i++){
                      if(equal(danhsachphieu![i], widget.reader.loanId)){
                        setState(() {
                          selectedloan=newvalue;
                        });
                      }
                    }
                  },),
                  const SizedBox(height: 10),

                          MyButton(
                          onTap: adddocgia,
                          text: 'Sửa Thông Tin Đọc Giả',

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
