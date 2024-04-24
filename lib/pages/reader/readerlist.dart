import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/buttonadd.dart';
import 'package:thuctap/pages/book/addBook.dart';
import 'package:thuctap/pages/book/editBook.dart';
import 'package:thuctap/pages/reader/addreader.dart';
import 'package:thuctap/pages/reader/editreader.dart';

import '../../model/reader.dart';

class ListReader extends StatefulWidget {
  List<Reader> items;
   ListReader({Key? key,required this.items});
   _ListReaderState createState() => _ListReaderState();
}
class _ListReaderState extends State<ListReader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Danh Sách Đọc Giả'),
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
                'Danh Sách Đọc Giả',
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
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                Reader reader=widget.items![index];
                return GestureDetector(
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Đọc Giả ${index + 1}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text('Tên Đọc Giả: ${reader.name}'),
                                SizedBox(height: 4),
                                Text('Email: ${reader.email}'),
                                SizedBox(height: 4),
                                Text('Số Điện Thoại: ${reader.phonenumber}'),
                                SizedBox(height: 4),
                                Text('Phiếu Mượn: ${reader.loanId}'),
                               
                              ],  
                            ),    
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => EditReader(reader: reader,)));
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
                    builder: (context) => AddReader(),
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
