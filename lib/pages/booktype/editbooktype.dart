import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';


class EditBookType extends StatefulWidget {
  EditBookType({Key? key}) : super(key: key);
  _EditBookTypeState createState() => _EditBookTypeState();
}

class _EditBookTypeState extends State<EditBookType> {
  final TextEditingController tenloaisachController = TextEditingController();

  void addloaisach() {
    // Thêm mã logic để xử lý việc thêm loại sách vào đây
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Sửa Thông Tin Loại Sách'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/31.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tên Loại Sách', style: TextStyle(fontWeight: FontWeight.bold)),
                MyTextField(controller: tenloaisachController, hintText: 'Tên Loại Sách', obScureText: false),
                SizedBox(height: 10),
                  MyButton(
                    onTap: addloaisach,
                    text: 'Sửa Loại Sách',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Sửa Loại Sách',
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
            left: 16,
            child: Image.asset(
              'assets/images/logo.png',
              width: 50,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
