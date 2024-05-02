import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/buttonadd.dart';
import 'package:thuctap/pages/book/addBook.dart';
import 'package:thuctap/pages/book/editBook.dart';
import 'package:thuctap/rest/booktype_function.dart';

import '../../model/book.dart';
import '../../rest/book_function.dart';
import '../../rest/getlist_function.dart';
import '../../utils.dart';

class ListBook extends StatefulWidget {
  late List<Book>? items;

  ListBook({Key? key, this.items}) : super(key: key);

  _ListBookState createState() => _ListBookState();
}
class _ListBookState extends State<ListBook> {
 late String booktype;
 late List<String> list;
 void getListname() async {
   List<String> result = await fetchListName('${Utils.baseUrl}/sach/tenloaisach',"tenloaisach");
   setState(() {
     list = result;
   });
 }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListname();
  }
  @override
  Widget build(BuildContext context) {
    if (widget.items == null || widget.items!.isEmpty) {
     return CircularProgressIndicator();
   }else {
      return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Danh Sách Sách'),
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
                'Danh Sách Sách',
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
              itemCount: widget.items?.length,
              itemBuilder: (context, index) {
                if (widget.items == null || widget.items!.isEmpty) {
                  return CircularProgressIndicator();
                }
                final book = widget.items![index];
                return FutureBuilder<String?>(
                  future: getName(book.genre, "tenloaisach", '${Utils.baseUrl}/sach/tenloaisach/${book.genre}'),
                  builder: (context, snapshot1) {
                    if (snapshot1.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot1.hasError) {
                      return Text('Error: ${snapshot1.error}');
                    } else {
                      String? typeName = snapshot1.data;
                      return FutureBuilder<String?>(
                        future: getName(book.author, "matacgia", '${Utils.baseUrl}/sach/authorname/${book.author}'),
                        builder: (context, snapshot2) {
                          if (snapshot2.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot2.hasError) {
                            return Text('Error: ${snapshot2.error}');
                          } else {
                            String? authorName = snapshot2.data;
                            return GestureDetector(
                              child: Card(
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      // Phần bên trái là ảnh sách
                                      Container(
                                        width: 80,
                                        height: 120,
                                        child: Image.network(
                                          book.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Sách ${book.name}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text("nhà xuất bản: ${book.publisher}"),
                                            SizedBox(height: 4),
                                            Text("Tác giả: $authorName"),
                                            SizedBox(height: 4),
                                            Text("tên sách: ${book.name}"),
                                            SizedBox(height: 4),
                                            Text("loại sách: $typeName"),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Book? editbook = widget.items?[index];
                                          if (editbook != null) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => EditBook(book: editbook),
                                              ),
                                            );
                                          }
                                        },
                                        icon: Icon(Icons.edit),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text("Xác nhận xóa sách"),
                                                content: Text("Bạn có chắc chắn muốn xóa cuốn sách này không?"),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop(false);
                                                    },
                                                    child: Text("Hủy"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
                                                      Navigator.of(context).pop(true);
                                                      await deleteBook(widget.items![index]);
                                                      Book? book = widget.items?[index];
                                                      if (book != null) {
                                                        setState(() {
                                                          widget.items?.removeAt(index);
                                                        });
                                                      }
                                                    },
                                                    child: Text("Xóa", style: TextStyle(color: Colors.red)),
                                                  ),
                                                ],
                                              );
                                            },
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
                          }
                        },
                      );
                    }
                  },
                );
              },
            )
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: AddButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddBook(),
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
}
