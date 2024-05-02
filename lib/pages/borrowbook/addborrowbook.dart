import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/model/borrowbook.dart';
import 'package:thuctap/rest/bookborrow_function.dart';
import 'package:thuctap/rest/getlist_function.dart';
import 'package:thuctap/utils.dart';

import '../../components/dropdownbutton.dart';
import 'borrowbooklist.dart';

class AddBorrowBook extends StatefulWidget {
   AddBorrowBook({super.key});
_AddBorrowBookState createState() => _AddBorrowBookState();
}

class _AddBorrowBookState extends State<AddBorrowBook> {
  //controller
  late List danhsachmadocgia=[];
  late List danhsachmaphieumuon=[];
  late List danhsachmasach=[];
  BookBorrow bookBorrow=BookBorrow();
  late bool _isLoading = true;
  String? selecteddocgia,selectedphieumuon,selectedmasach;


  final TextEditingController namebookController = TextEditingController();

  //butonadd
  void addsachmuon()async{
  bookBorrow.bookname=namebookController.text;
  bookBorrow.idreader=selecteddocgia!;
  bookBorrow.idbook=selectedmasach!;
  bookBorrow.loanid=selectedphieumuon!;
  await insertBookborrow(bookBorrow);
  List<BookBorrow> bookList= await fetchBookBorrow();
  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListBorrowBook(items: bookList,)));
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
  void getListmatacgia()async{
    try {
      _isLoading = true;
      danhsachmadocgia = await fetchListName("${Utils.baseUrl}/sachmuon/madocgia","madocgia");
      setState(() {
        _isLoading = false; // Đặt trạng thái tải dữ liệu thành false khi đã tải xong
      });
    } catch (e) {
      print('Error fetching loan id: $e');
    }
  }
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListmaphieumuon();
    getListmasach();
    getListmatacgia();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Thêm Sách Mượn'),
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
                          'Thêm Sách Mượn',
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
                  Text('Tên Sách' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: namebookController, hintText: 'Tên Loại Sách', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Tên Đọc Giả' , style: TextStyle(fontWeight: FontWeight.bold)),
                          ListItems(items: danhsachmadocgia, onChanged: (newvalue){
                            for(int i=0;i<danhsachmadocgia.length;i++){
                              if(equal(danhsachmadocgia![i], newvalue)){
                                setState(() {
                                  selecteddocgia=newvalue;
                                });
                              }
                            }
                          },),
                  const SizedBox(height: 10),
                  Text('Mã Phiếu Mượn' , style: TextStyle(fontWeight: FontWeight.bold)),
                          ListItems(items: danhsachmaphieumuon, onChanged: (newvalue){
                            for(int i=0;i<danhsachmaphieumuon.length;i++){
                              if(equal(danhsachmaphieumuon![i], newvalue)){
                                setState(() {
                                  selectedphieumuon=newvalue;
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
                          MyButton(
                            onTap: addsachmuon,
                            text: 'Thêm Sách',
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
