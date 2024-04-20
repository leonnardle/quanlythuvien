import 'package:flutter/material.dart';
import 'package:thuctap/pages/author/authorlist.dart';
import 'package:thuctap/pages/booktype/booktypelist.dart';
import 'package:thuctap/pages/employee/employeelist.dart';
import 'package:thuctap/pages/publisher/publisherlist.dart';
import 'package:thuctap/pages/book/booklist.dart';
import 'package:thuctap/pages/reader/readerlist.dart';
import 'package:thuctap/pages/loanslip/loansliplist.dart';
import 'package:thuctap/pages/paymentslip/paymentsliplist.dart';
import 'package:thuctap/pages/borrowbook/borrowbooklist.dart';

import '../model/book.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('example',
              style: TextStyle(
                color: Colors.black
              ),
              ), 
              accountEmail: Text('example@email.com',
               style: TextStyle(
                color: Colors.black
              ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('images/31.png'),
                    fit: BoxFit.cover,
                    ),
                    
                ),
              ),
          ListTile(
            title: Text('Quản Lý Nhân Viên'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListEmployee()
                  )
              );
            },
          ),
          ListTile(
            title: Text('Quản Lý Loại Sách'),
            onTap: ()=> {
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListBookType()
                  )
              )
            },
          ),
          ListTile(
            title: Text('Quản Lý Nhà Xuất Bản'),
            onTap: ()=> {
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListPublisher()
                  )
              )
            },
          ),
          ListTile(
            title: Text('Quản Lý Tác Giả'),
           onTap: ()=> {
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListAuthor()
                  )
              )
            },
          ),
          ListTile(
            title: Text('Quản Lý Thông Tin Sách'),
            onTap: () async {
               List<Book> bookList= await fetchBooks();
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListBook(items: bookList,)
                  )
              );
            },
          ),
          ListTile(
            title: Text('Quản Lý Sách Mượn'),
            onTap: ()=> {
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListBorrowBook()
                  )
              )
            },
          ),
          ListTile(
            title: Text('Quản Lý Đọc Giả'),
          onTap: ()=> {
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListReader()
                  )
              )
            },
          ),
          ListTile(
            title: Text('Quản Lý Phiếu Mượn'),
           onTap: ()=> {
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListLoanSlip()
                  )
              )
            },
          ),
          ListTile(
            title: Text('Quản Lý Phiếu Trả'),
             onTap: ()=> {
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListPaymentSLip()
                  )
              )
            },
          ),
          ],
        ),
    );
  }
}