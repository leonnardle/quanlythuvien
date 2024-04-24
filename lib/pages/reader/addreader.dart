import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thuctap/components/dropdownbutton.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/model/reader.dart';
import 'package:thuctap/pages/reader/readerlist.dart';
import 'package:thuctap/rest/reader_function.dart';

class AddReader extends StatefulWidget {
   AddReader({super.key});
_AddReaderState createState() => _AddReaderState();
}

class _AddReaderState extends State<AddReader> {
  //controller
  late TextEditingController idReaderController = TextEditingController();
  late TextEditingController nameReaderController = TextEditingController();
  late TextEditingController emailReaderController = TextEditingController();
  late TextEditingController phoneReaderController = TextEditingController();
  late List danhsachphieu;
  Reader reader =Reader();

  bool _isLoading = true;
  //butonadd
  void adddocgia() async{
      reader.email=emailReaderController.text;
      reader.phonenumber=phoneReaderController.text;
      reader.id=idReaderController.text;
      reader.name=nameReaderController.text;
      await  insertreader(reader);
      List<Reader> list=await fetchreaders();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ListReader(items: list)));
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    if(_isLoading){
      return CircularProgressIndicator();
    }else {
      return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Thêm Đọc Giả'),
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
                          'Thêm Đọc Giả',
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
                          Text('ma Đọc Giả' , style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: idReaderController, hintText: 'madocgia', obScureText: false),
                          const SizedBox(height: 10),
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

                  ListItems(items: danhsachphieu, onChanged: (newvalue ) {
                    setState(() {
                      reader.loanId=newvalue!;
                    });
                  },),
                  const SizedBox(height: 10),
                          MyButton(
                          onTap:  adddocgia,
                          text: 'Thêm Đọc Giả',
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
}
