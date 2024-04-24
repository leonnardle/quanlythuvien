import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/textfield.dart';
import 'package:thuctap/components/button.dart';
import 'package:thuctap/model/booktype.dart';
import 'package:thuctap/pages/booktype/booktypelist.dart';
import 'package:thuctap/rest/booktype_function.dart';


class AddBookType extends StatefulWidget {
  AddBookType({Key? key}) : super(key: key);
_AddBookTypeState createState() => _AddBookTypeState();
}

class _AddBookTypeState extends State<AddBookType> {
  final TextEditingController tenloaisachController = TextEditingController();
  final TextEditingController maloaisachController = TextEditingController();

  void addLoaisach() async{
    // Thêm mã logic để xử lý việc thêm loại sách vào đây
    if(maloaisachController.text!=null&&tenloaisachController.text!=null) {
      BookType bookType = BookType();
      bookType.setId(maloaisachController.text);
      bookType.setName(tenloaisachController.text);
      await insertBooktype(bookType);
      List<BookType> list=await fetchBookType();
      Navigator.push(context, MaterialPageRoute(builder:(context)=> ListBookType(items: list,)));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Thêm Loại Sách'),
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
                  Text('mã Loại Sách', style: TextStyle(fontWeight: FontWeight.bold)),
                MyTextField(controller: maloaisachController, hintText: 'mã Loại Sách', obScureText: false),
                  SizedBox(height: 10),
                  Text('Tên Loại Sách', style: TextStyle(fontWeight: FontWeight.bold)),
                  MyTextField(controller: tenloaisachController, hintText: 'Tên Loại Sách', obScureText: false),
                  SizedBox(height: 10),
                  MyButton(
                    onTap: addLoaisach,
                    text: 'Thêm Loại Sách',
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
                'Thêm Loại Sách',
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
