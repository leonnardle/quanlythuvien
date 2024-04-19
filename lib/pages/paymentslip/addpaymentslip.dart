import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';

class AddPaymentSlip extends StatefulWidget {
   AddPaymentSlip({super.key});
   _AddPaymentSlipState createState() => _AddPaymentSlipState();
}
class _AddPaymentSlipState extends State<AddPaymentSlip> {

  //controller
  final TextEditingController readerNameController = TextEditingController();
  final TextEditingController IDBookController = TextEditingController();
  final TextEditingController StatusController = TextEditingController();
  final TextEditingController LoanDayController = TextEditingController();
  final TextEditingController PaymentDayController = TextEditingController();
  
  //butonadd
  void addphieutra(){

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Thêm Phiếu Trả'),
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
                          'Thêm Phiếu Trả',
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
                  MyTextField(controller: readerNameController, hintText: 'Tên Nhà Xuất bản', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Mã Sách' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: IDBookController, hintText: 'Tên Khu Vực', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Trạng Thái' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: StatusController, hintText: 'Tên Khu Vực', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Ngày Mượn' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: LoanDayController, hintText: 'Tên Khu Vực', obScureText: false),
                  const SizedBox(height: 10),
                  Text('Ngày Trả' , style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: PaymentDayController, hintText: 'Tên Khu Vực', obScureText: false),
                  const SizedBox(height: 10),

                          MyButton(
                            onTap: addphieutra,
                            text: 'Thêm Phiếu Trả',

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
