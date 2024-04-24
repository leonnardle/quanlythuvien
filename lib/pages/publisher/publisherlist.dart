import 'package:flutter/material.dart';
import 'package:thuctap/components/navbar.dart';
import 'package:thuctap/components/buttonadd.dart';
import 'package:thuctap/function/showDialog.dart';

import 'package:thuctap/pages/publisher/addpublisher.dart';
import 'package:thuctap/pages/publisher/editpublisher.dart';
import 'package:thuctap/rest/publisher_function.dart';

import '../../model/publisher.dart';


class ListPublisher extends StatefulWidget {
  List<Publisher> items;
   ListPublisher({Key? key,required this.items});
   _ListPublisherState createState() => _ListPublisherState();
}
class _ListPublisherState extends State<ListPublisher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Danh Sách Nhà Xuất Bản'),
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
                'Danh Sách Nhà Xuất Bản',
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
                Publisher publisher=widget.items[index];
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
                                  'Nhà Xuất Bản ${index + 1}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text('Tên Nhà Xuất Bản: ${publisher.name}'),
                                SizedBox(height: 4),
                                Text('Khu Vực: ${publisher.area}'),
                                
                              ],  
                            ),    
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => EditPublisher(publisher: publisher,)));
                            },
                            icon: Icon(Icons.edit),
                          ),
                           IconButton(
                            onPressed: () {
                              // Xử lý sự kiện xóa sách
                              showDeleteConfirmationDialog(context, (confirm)async {
                                if(confirm){
                                  await deletePublisher(publisher);
                                  setState(() {
                                    if(publisher!=null){
                                      widget.items.removeAt(index);
                                    }
                                  });
                                }
                              });
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
                    builder: (context) => AddPublisher(),
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
