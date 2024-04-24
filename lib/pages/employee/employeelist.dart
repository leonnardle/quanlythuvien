import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/buttonadd.dart';
import 'package:thuctap/function/showDialog.dart';
import 'package:thuctap/model/Employee.dart';
import 'package:thuctap/pages/employee/addemployee.dart';
import 'package:thuctap/pages/employee/editemployee.dart';
import 'package:thuctap/rest/employee_function.dart';

class ListEmployee extends StatefulWidget {
  late List<Employee>? items;

  ListEmployee({Key? key,required this.items});

@override
_ListEmployeeState createState() => _ListEmployeeState();
}
  class _ListEmployeeState extends State<ListEmployee> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Danh Sách Nhân Viên'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/31.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Danh Sách Nhân Viên',
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
            left: 938,
            right: 0,
            child: Image.asset(
              'assets/images/logo.png',
              width: 50,
              height: 50,
            ),
          ),
          Positioned.fill(
            top: 50,
            child: ListView.builder(
              itemCount: widget.items!.length,
              itemBuilder: (context, index) {
                Employee employee=widget.items![index];
                return GestureDetector(
                 
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nhân viên ${index + 1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('Tên Nhân Viên: ${employee.name}'),
                              SizedBox(height: 4),
                              Text('Email: ${employee.email}'),
                              SizedBox(height: 4),
                              Text('Lương: ${employee.salary}'),
                              SizedBox(height: 4),
                              Text('Số Điện Thoại: ${employee.phonenumber}'),
                              SizedBox(height: 4),
                              Text('số ngày công: ${employee.worknumber}'),
                              SizedBox(height: 4),
                              Text('mật khẩu: ${employee.password}'),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => EditEmployee(employee: widget.items![index],)));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: ()async {
                                  // Xử lý sự kiện khi nhấn nút "Xóa"
                                 showDeleteConfirmationDialog(context, (confirm) async{
                                   if(confirm){
                                     await deleteEmployee(widget.items![index]);
                                     Employee? book = widget.items?[index];
                                     if (book != null) {
                                       setState(() {
                                         widget.items?.removeAt(index);
                                       });
                                     }
                                   }
                                 });

                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: AddButton(
               onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEmployee(), // Chuyển hướng đến trang AddEmployee
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
