import 'package:flutter/material.dart';
import 'package:thuctap/model/Employee.dart';
import 'package:thuctap/model/author.dart';
import 'package:thuctap/model/booktype.dart';
import 'package:thuctap/model/reader.dart';
import 'package:thuctap/pages/author/authorlist.dart';
import 'package:thuctap/pages/booktype/booktypelist.dart';
import 'package:thuctap/pages/employee/employeelist.dart';
import 'package:thuctap/pages/book/booklist.dart';
import 'package:thuctap/pages/reader/readerlist.dart';
import 'package:thuctap/pages/loanslip/loansliplist.dart';
import 'package:thuctap/pages/paymentslip/paymentsliplist.dart';
import 'package:thuctap/pages/borrowbook/borrowbooklist.dart';
import 'package:thuctap/rest/author_function.dart';
import 'package:thuctap/rest/booktype_function.dart';
import 'package:thuctap/rest/employee_function.dart';
import 'package:thuctap/rest/reader_function.dart';

import '../model/book.dart';
import '../model/publisher.dart';
import '../pages/publisher/publisherlist.dart';
import '../rest/book_function.dart';
import '../rest/publisher_function.dart';

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
            onTap: ()async {
              List<Employee> list=await fetchEmployee();
              Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListEmployee(items: list,)
                  )
              );
            },
          ),
          ListTile(
            title: Text('Quản Lý Loại Sách'),
            onTap: ()async {
              List<BookType> bookTypelist=await fetchBookType();
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListBookType(items: bookTypelist,)
                  )
              );
            },
          ),
          ListTile(
            title: Text('Quản Lý Nhà Xuất Bản'),
            onTap: ()async {
              List<Publisher> list= (await fetchPublishers()).cast<Publisher>();
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListPublisher(items: list,)
                  )
              );
            },
          ),
          ListTile(
            title: Text('Quản Lý Tác Giả'),
           onTap: ()async {
              List<Author> list=await fetchAuthor();
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListAuthor(items: list,)
                  )
              );
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
          onTap: ()async {
              List<Reader> list=await fetchreaders();
               Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => ListReader(items: list,)
                  )
              );
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