import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';

class EditEmployee extends StatefulWidget {
  EditEmployee({Key? key}) : super(key: key);

  @override
  _EditEmployeeState createState() => _EditEmployeeState();
}
  class _EditEmployeeState extends State<EditEmployee> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void addEm() {
    // Thêm mã logic để xử lý việc thêm nhân viên vào đây
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Sửa Nhân Viên'),
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
                          'Sửa Nhân Viên',
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
                          Text('Tên Nhân Viên', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: nameController, hintText: 'Tên Nhân Viên', obScureText: false),
                          SizedBox(height: 10),
                          Text('Mật Khẩu', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: passController, hintText: 'Mật Khẩu', obScureText: false),
                          SizedBox(height: 10),
                          Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: emailController, hintText: 'Email', obScureText: false),
                          SizedBox(height: 10),
                          Text('Lương', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: salaryController, hintText: 'Lương', obScureText: false),
                          SizedBox(height: 10),
                          Text('Số Điện Thoại', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(controller: phoneController, hintText: 'Số Điện Thoại', obScureText: false),
                          SizedBox(height: 20),
                          MyButton(
                            onTap: addEm,
                            text: 'Sửa Nhân Viên',
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
