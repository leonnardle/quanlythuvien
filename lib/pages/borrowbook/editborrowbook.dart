import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';

class EditBorrowBook extends StatefulWidget {
   EditBorrowBook({super.key});
   _EditBorrowBookState createState() => _EditBorrowBookState();
}

class _EditBorrowBookState extends State<EditBorrowBook> {

  //controller
  final TextEditingController namebookController = TextEditingController();
  final TextEditingController authornameController = TextEditingController();
  final TextEditingController loanslipController = TextEditingController();
  final TextEditingController IDbookController = TextEditingController();
  final TextEditingController pictureEditBorrowBookController = TextEditingController();
  String? imageURL;
  //butonadd
  void addsachmuon(){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Sửa Thông TIn Sách Mượn'),
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
                          'Sửa Thông Tin Sách Mượn',
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
                  MyTextField(controller: authornameController, hintText: 'Tên Loại Sách', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Mã Phiếu Mượn' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: loanslipController, hintText: 'Tên Loại Sách', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Mã Sách' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: IDbookController, hintText: 'Tên Loại Sách', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Hình Ảnh', style: TextStyle(fontWeight: FontWeight.bold)),
                          MyTextField(
                            controller: pictureEditBorrowBookController,
                            hintText: 'Link Hình Ảnh',
                            obScureText: false,
                            onChanged: (value) {
                              
                             setState(() {
                                // Kiểm tra xem đường dẫn có hợp lệ không
                                Uri? uri = Uri.tryParse(value);
                                if (uri != null && uri.isAbsolute) {
                                  // Nếu hợp lệ, gán vào imageURL
                                  imageURL = value;
                                   const SizedBox(height: 10);
                          // Hiển thị hình ảnh nếu có
                     
                          if (imageURL != null && imageURL!.isNotEmpty)
                            // ignore: curly_braces_in_flow_control_structures
                            Image.network(
                              imageURL!,
                              height: 100,
                              width: 50,
                          
                            );
                                } else {
                                  // Nếu không hợp lệ, gán imageURL thành null
                                  imageURL = null;
                                    Image.network(
                              '',
                              height: 100,
                              width: 50,
                          
                            );
                                }
                              });
                            },
                          ),
                          MyButton(
                           onTap: addsachmuon,
                          text: 'Sửa Thông Tin Sách Mượn',

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
