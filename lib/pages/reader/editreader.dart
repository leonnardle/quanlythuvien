import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';

class EditReader extends StatefulWidget {
   EditReader({super.key});
_EditReaderState createState() => _EditReaderState();
}

class _EditReaderState extends State<EditReader> {
  //controller
  final TextEditingController nameReaderController = TextEditingController();
  final TextEditingController emailReaderController = TextEditingController();
  final TextEditingController phoneReaderController = TextEditingController();
  final TextEditingController loanReaderController = TextEditingController();
  //butonadd
  void adddocgia(){

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
                  MyTextField(controller: loanReaderController, hintText: 'Tên Khu Vực', obScureText: false),
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
