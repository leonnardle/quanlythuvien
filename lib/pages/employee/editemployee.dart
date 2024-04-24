import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/numbertextfield.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/pages/employee/employeelist.dart';
import 'package:thuctap/rest/employee_function.dart';

import '../../model/Employee.dart';

class EditEmployee extends StatefulWidget {
  Employee employee;
  EditEmployee({Key? key, required this.employee}) : super(key: key);

  @override
  _EditEmployeeState createState() => _EditEmployeeState();
}
  class _EditEmployeeState extends State<EditEmployee> {
  late  TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passController = TextEditingController();
  late  TextEditingController salaryController = TextEditingController();
  late  TextEditingController phoneController = TextEditingController();
  late TextEditingController workNumberController = TextEditingController();

  void addEm() async{
    // Thêm mã logic để xử lý việc thêm nhân viên vào đây
    widget.employee.name=nameController.text;
    widget.employee.email=emailController.text;
    widget.employee.password=passController.text;
    widget.employee.salary=double.parse(salaryController.text);
    widget.employee.phonenumber=phoneController.text;
    widget.employee.worknumber=int.parse(workNumberController.text);
    await updateEmployee(widget.employee);
    List<Employee> employeeList= await fetchEmployee();
    Navigator.push(
        context, MaterialPageRoute(
        builder:(context) => ListEmployee(items: employeeList,)
    )
    );

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController=TextEditingController(text: widget.employee?.name);
    emailController=TextEditingController(text: widget.employee?.email);
    passController=TextEditingController(text: widget.employee?.password);
    phoneController=TextEditingController(text: widget.employee?.phonenumber);
    salaryController=TextEditingController(text: widget.employee?.salary.toString());
    workNumberController=TextEditingController(text: widget.employee?.worknumber.toString());
  }
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    phoneController.dispose();
    salaryController.dispose();
    workNumberController.dispose();
    super.dispose();
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
                          NumTextField(controller: salaryController, hintText: 'Lương', obscureText: false),
                          SizedBox(height: 10),
                          Text('số ngày công', style: TextStyle(fontWeight: FontWeight.bold)),
                          NumTextField(controller: workNumberController, hintText: 'số ngày công', obscureText: false),
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
