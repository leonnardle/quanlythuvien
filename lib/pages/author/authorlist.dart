import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/buttonadd.dart';
import 'package:thuctap/pages/author/editauthor.dart';
import 'package:thuctap/pages/author/addauthor.dart';
import 'package:thuctap/rest/author_function.dart';

import '../../function/showDialog.dart';
import '../../model/author.dart';

class ListAuthor extends StatefulWidget {
  List<Author> items;
   ListAuthor({Key? key,required this.items});
  _ListAuthorState createState() => _ListAuthorState();
}
class _ListAuthorState extends State<ListAuthor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Danh Sách Tác Giả'),
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
                'Danh Sách Tác Giả',
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
                Author author=widget.items![index];
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
                                'Tác Giả ${index + 1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('Tên Tác Giả: ${author.name}'),
                              SizedBox(height: 4),
                              Text('Quê Quán: ${author.country}'),
                              SizedBox(height: 4),
                              Text('tiểu sử: ${author.story}'),
                              
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                 Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => EditAuthor(author: author,)));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  // Xử lý sự kiện khi nhấn nút "Xóa"
                                  showDeleteConfirmationDialog(context, (confirm) async{
                                    if(confirm){
                                      await deleteAuthor(widget.items![index]);
                                      if (author != null) {
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
                    builder: (context) => AddAuthor(), // Chuyển hướng đến trang AddEmployee
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
