import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/buttonadd.dart';
import 'package:thuctap/pages/book/addBook.dart';
import 'package:thuctap/pages/book/editBook.dart';
import 'package:thuctap/pages/loanslip/addloanslip.dart';
import 'package:thuctap/pages/loanslip/editloanslip.dart';

class ListLoanSlip extends StatefulWidget {
  const ListLoanSlip({Key? key});
   _ListLoanSlipState createState() => _ListLoanSlipState();
}

class _ListLoanSlipState extends State<ListLoanSlip> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Danh Sách Phiếu Mượn'),
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
                'Danh Sách Phiếu Mượn',
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Phần bên trái là ảnh sách
                          Container(
                            width: 80,
                            height: 120,
                            child: Image.network(
                              "https://hoc10.monkeyuni.net/E_Learning/page_public/weNu4P5lGC23ozvy58eXenxvxfUWyyqg.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20), // Khoảng cách giữa ảnh sách và thông tin sách
                          // Phần bên phải là thông tin sách
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phiếu Mượn ${index + 1}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text('Tên Đọc Giả: Tên sách ở đây'),
                                SizedBox(height: 4),
                                Text('Mã Sách: Nhà xuất bản ở đây'),
                                SizedBox(height: 4),
                                Text('Trạng Thái: Chi tiết sách ở đây'),
                                SizedBox(height: 4),
                                Text('Ngày Mượn: Tác giả ở đây'),
                                SizedBox(height: 4),
                                Text('Ngày Trả: Thể loại ở đây'),
                                
                              ],  
                            ),    
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => EditLoanSlip()));
                            },
                            icon: Icon(Icons.edit),
                          ),
                           IconButton(
                            onPressed: () {
                              // Xử lý sự kiện xóa sách
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],  
                      ),
                    ),
                  ),
                  onTap: () {
                    // Xử lý sự kiện khi nhấn vào một sách
                  },
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
                    builder: (context) => AddLoanSlip(),
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