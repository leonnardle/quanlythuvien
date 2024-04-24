import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/buttonadd.dart';
import 'package:thuctap/function/showDialog.dart';
import 'package:thuctap/model/booktype.dart';
import 'package:thuctap/pages/booktype/addbooktype.dart';
import 'package:thuctap/pages/booktype/editbooktype.dart';
import 'package:thuctap/rest/book_function.dart';
import 'package:thuctap/rest/booktype_function.dart';

class ListBookType extends StatefulWidget {
  late List<BookType>? items;

  ListBookType({Key? key, this.items}) : super(key: key);
  _ListBookTypeState createState() => _ListBookTypeState();
}

class _ListBookTypeState extends State<ListBookType> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Danh Sách Loại Sách'),
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
                'Danh Sách Loại Sách',
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
                BookType booktype=widget.items![index];
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
                                  'Loại Sách ${index + 1}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text('mã loại : ${booktype.id}'),
                                SizedBox(height: 4),
                                Text('tên loại : ${booktype.name}'),
                              ],  
                            ),    
                          ),
                          IconButton(
                            onPressed: () {

                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => EditBookType(book: widget.items![index],)));
                            },
                            icon: Icon(Icons.edit),
                          ),
                           IconButton(
                            onPressed: () {
                              // Xử lý sự kiện xóa sách

                              showDeleteConfirmationDialog(context, (confirm) async {
                                if(confirm){
                                  await deleteBooktype(widget.items![index]);
                                  BookType? book = widget.items?[index];
                                  if (book != null) {
                                    setState(() {
                                      widget.items?.removeAt(index);
                                    });
                                  }

                                }
                              }
                              );
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
                    builder: (context) => AddBookType(),
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
